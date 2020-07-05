import 'package:grocery/model/product.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'raw_non_veg_store.g.dart';

class RawNonVegStore = _RawNonVegStore with _$RawNonVegStore;

abstract class _RawNonVegStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, Product> filterNonVegMap =
      ObservableMap<String, Product>();

  @observable
  ObservableMap<String, Vendor> nonVegVendors = ObservableMap<String, Vendor>();

  @observable
  ObservableMap<String, List<Product>> nonVegMap =
      ObservableMap<String, List<Product>>();

  @action
  getRawNonVegList() async {
    if (nonVegMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response = await getProductService
            .getProductList(collectionName: 'raw_non_veg');
        print("reponse in raw non veg store");
        print(response);
        nonVegMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in raw non veg store");
        print(e);
        throw e;
      }
    }
  }

  @action
  getRawNonVegVendors() async {
    if (nonVegVendors.isEmpty) {
      isLoading = true;
      try {
        Map<String, Vendor> response = await getWorkerService.getVendors(
            collectionName: 'raw_non_veg', documentId: 'vendors');
        print("reponse in raw non veg store");
        print(response);
        nonVegVendors.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in raw non veg store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterNonVegMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    nonVegMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterNonVegMap.addAll({element.name: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterNonVegMap.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterNonVegMap = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    nonVegMap = ObservableMap<String, List<Product>>();
    isSearching = false;
    filterNonVegMap = ObservableMap<String, Product>();
  }
}
