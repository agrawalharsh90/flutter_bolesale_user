import 'dart:io';

import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'grocery_store.g.dart';

class GroceryStore = _GroceryStore with _$GroceryStore;

abstract class _GroceryStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, Product> filterGroceryMap =
      ObservableMap<String, Product>();

  @observable
  ObservableMap<String, List<Product>> groceryMap =
      ObservableMap<String, List<Product>>();

  @observable
  Map<String, dynamic> groceryList = ObservableMap<String, dynamic>();

  @action
  getGroceryData() async {
    if (groceryMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response =
            await getProductService.getProductList(collectionName: 'groceries');
        print("reponse in grocery store");
        print(response);
        groceryMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in grocery store");
        print(e);
        throw e;
      }
    }
  }

  @action
  addGroceryList({File imageFile, String id}) async {
    isLoading = true;
    try {
      String url = await firebaseService.uploadFile(
          folderName: 'groceryList', fileName: id, file: imageFile);
      Map<String, dynamic> response = await orderService
          .postOrders({'listUrl': url}, 'groceryList', fileId: id);
      groceryList.addAll({response['id']: response});
      isLoading = false;
    } catch (e) {
      print("error in post grocery store");
      print(e);
      isLoading = false;
      throw e;
    }
  }

  @action
  getGroceryList() async {
    if (groceryList.isEmpty) {
      isLoading = true;
      try {
        Map<String, dynamic> response =
            await orderService.getOrderDataMap('groceryList');
        print("reponse in groceryList order store");
        print(response);
        groceryList.addAll(response);
        isLoading = false;
      } catch (e) {
        print("error in groceryList order store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterGroceryMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    groceryMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterGroceryMap.addAll({element.name: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterGroceryMap.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterGroceryMap = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    groceryMap = ObservableMap<String, List<Product>>();
    isSearching = false;
    filterGroceryMap = ObservableMap<String, Product>();
    groceryList = ObservableMap<String, dynamic>();
  }
}
