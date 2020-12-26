import 'dart:convert';

import 'package:grocery/model/order.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isFetching = false;

  @observable
  Map<String, Order> combo = ObservableMap<String, Order>();

  @action
  postComboRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> value = await orderService.postOrders(data);
      Order order = Order.fromJson(jsonDecode(jsonEncode(value)));
      Map<String, dynamic> orders = jsonDecode(jsonEncode(value));
      orders.remove('address');
      orders.remove('id');
      orders.remove('paid');
      orders.remove('uid');
      orders.remove('totalAmount');
      orders.remove('createdAt');
      orders.forEach((k, v) {
        Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
        vc.forEach((key, value) {
          Product product = Product.fromJson(jsonDecode(jsonEncode(value)));
          if (order.ordersMap == null)
            order.ordersMap = {product.productID: product};
          else
            order.ordersMap.addAll({product.productID: product});
        });
      });
      combo.addAll({order.id: order});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in post order Request");
      print(e);
      throw e;
    }
  }

  @action
  getComboOrders() async {
    if (combo.isEmpty) {
      isFetching = true;
      try {
        Map<String, dynamic> response = await orderService.getOrderDataMap();
        print("reponse in order store");
        print(response);
        response.forEach((key, value) {
          Order order = Order.fromJson(jsonDecode(jsonEncode(value)));
          Map<String, dynamic> orders = jsonDecode(jsonEncode(value));
          orders.remove('address');
          orders.remove('id');
          orders.remove('paid');
          orders.remove('uid');
          orders.remove('totalAmount');
          orders.remove('createdAt');
          orders.forEach((k, v) {
            Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
            vc.forEach((key, value) {
              Product product = Product.fromJson(jsonDecode(jsonEncode(value)));
              if (order.ordersMap == null)
                order.ordersMap = {product.productID: product};
              else
                order.ordersMap.addAll({product.productID: product});
            });
          });
          combo.addAll({order.id: order});
        });
        isFetching = false;
      } catch (e) {
        print("error in order store");
        print(e);
        isFetching = false;
        throw e;
      }
    }
  }

  @action
  clearStore() {
    isLoading = false;
    isFetching = false;
    combo = ObservableMap<String, Order>();
  }
}
