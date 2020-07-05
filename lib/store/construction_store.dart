import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'construction_store.g.dart';

class ConstructionStore = _ConstructionStore with _$ConstructionStore;

abstract class _ConstructionStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, List<Product>> constructionMap =
      ObservableMap<String, List<Product>>();
  @observable
  ObservableMap<String, Product> filterConstructionMap =
      ObservableMap<String, Product>();

  @action
  getConstructionList() async {
    if (constructionMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response = await getProductService
            .getProductList(collectionName: 'construction_material');
        print("reponse in construction store");
        print(response);
        constructionMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in construction store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filterConstructionMap = ObservableMap<String, Product>();
    List<Product> dataList = List();
    constructionMap.forEach((key, value) {
      if (key.toLowerCase().contains(searchString.toLowerCase())) {
        value.forEach((element) {
          filterConstructionMap.addAll({element.name: element});
        });
      } else
        dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filterConstructionMap.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filterConstructionMap = ObservableMap<String, Product>();
  }

  @action
  clearStore() {
    isLoading = false;
    isSearching = false;
    constructionMap = ObservableMap<String, List<Product>>();
    filterConstructionMap = ObservableMap<String, Product>();
  }
}
