import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'vegs_fruits_store.g.dart';

class VegFuitsStore = _VegFuitsStore with _$VegFuitsStore;

abstract class _VegFuitsStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, Product> filterVegFruitsList =
      ObservableMap<String, Product>();

  @observable
  ObservableMap<String, List<Product>> vegFruitsList =
      ObservableMap<String, List<Product>>();

  @action
  getVegFruitsList() async {
    if (vegFruitsList.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response = await getProductService
            .getProductList(collectionName: 'veg_fruits');
        print("reponse in veg fruits store");
        print(response);
        vegFruitsList.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in veg fruits store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterVegFruitsList = ObservableMap<String, Product>();
    List<Product> dataList = List();
    vegFruitsList.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterVegFruitsList.addAll({element.name: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterVegFruitsList.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterVegFruitsList = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    vegFruitsList = ObservableMap<String, List<Product>>();
    isSearching = false;
    filterVegFruitsList = ObservableMap<String, Product>();
  }
}
