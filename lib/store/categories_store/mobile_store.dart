import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'mobile_store.g.dart';

class MobileStore = _MobileStore with _$MobileStore;

abstract class _MobileStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, List<Product>> productMap =
      ObservableMap<String, List<Product>>();
  @observable
  ObservableMap<String, Product> filterProductMap =
      ObservableMap<String, Product>();

  @action
  fetchProductMap() async {
    if (productMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response = await getProductService
            .getProductList(collectionName: 'mobile');
        print("reponse in mobile store");
        print(response);
        productMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in mobile store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    await fetchProductMap();
    filterProductMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    productMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterProductMap.addAll({element.productID: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.product.toLowerCase().contains(searchString.toLowerCase()))
        filterProductMap.addAll({element.productID: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterProductMap = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    isSearching = false;
    productMap = ObservableMap<String, List<Product>>();
    filterProductMap = ObservableMap<String, Product>();
  }
}
