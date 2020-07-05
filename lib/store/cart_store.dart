import 'package:grocery/model/product.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, Map<String, Product>> cartMap =
      ObservableMap<String, Map<String, Product>>();

  @observable
  int totalItems = 0;

  @observable
  double totalAmount = 0;

  @action
  updateCartMap(Map<String, Map<String, Product>> dataMap) async {
    isLoading = true;
    dataMap.forEach((key, value) {
      if (cartMap.containsKey(key)) {
        cartMap[key].addAll(value);
      } else {
        cartMap.addAll({key: value});
      }
    });

    double amount = 0;
    int items = 0;
    cartMap.forEach((key, data) {
      items = items + data.values.toList().length;
      data.values.toList().forEach((value) {
        amount = amount + (double.parse(value.price) * value.quantity);
      });
    });
    totalAmount = amount;
    totalItems = items;
    print("updated cart map");
    print(cartMap);
    isLoading = false;
  }

  @action
  deleteProductCart(String type, String key) async {
    isLoading = true;
    cartMap[type].remove(key);

    if (cartMap[type].length == 0) cartMap.remove(type);

    double amount = 0;
    int items = 0;
    cartMap.forEach((key, data) {
      items = items + data.values.toList().length;
      data.values.toList().forEach((value) {
        amount = amount + (double.parse(value.price) * value.quantity);
      });
    });
    totalAmount = amount;
    totalItems = items;
    print("updated cart map");
    print(cartMap);
    isLoading = false;
  }

  @action
  clearStore() {
    isLoading = false;
    cartMap = ObservableMap<String, Map<String, Product>>();
    totalItems = 0;
    totalAmount = 0;
  }
}
