import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'sweets_cakes_store.g.dart';

class SweetsCakesStore = _SweetsCakesStore with _$SweetsCakesStore;

abstract class _SweetsCakesStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, Product> filterSweetCakeMap =
      ObservableMap<String, Product>();

  @observable
  ObservableMap<String, List<Product>> sweetCakeMap =
      ObservableMap<String, List<Product>>();

  @action
  getSweetCakeList() async {
    if (sweetCakeMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response = await getProductService
            .getProductList(collectionName: 'sweets_cakes');
        print("reponse in sweets cakes store");
        print(response);
        sweetCakeMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in sweets cakes store");
        print(e);
        throw e;
      }
    }
  }


  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterSweetCakeMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    sweetCakeMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterSweetCakeMap.addAll({element.name: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterSweetCakeMap.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterSweetCakeMap = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    sweetCakeMap = ObservableMap<String, List<Product>>();
    isSearching = false;
    filterSweetCakeMap = ObservableMap<String, Product>();
  }
}
