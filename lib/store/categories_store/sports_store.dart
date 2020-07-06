import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'sports_store.g.dart';

class SportsStore = _SportsStore with _$SportsStore;

abstract class _SportsStore with Store {
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
            .getProductList(collectionName: 'sports');
        print("reponse in sports store");
        print(response);
        productMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in sports store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterProductMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    productMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterProductMap.addAll({element.sellerId: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.sellerId.toLowerCase().contains(searchString.toLowerCase()))
        filterProductMap.addAll({element.sellerId: element});
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
