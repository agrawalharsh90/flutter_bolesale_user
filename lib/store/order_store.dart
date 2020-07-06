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
  Map<String, Order> combo = ObservableMap<String, Order>();

  @action
  postComboRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> value = await orderService.postOrders(data, 'combo');
      Order rawNonVegOrder = Order.fromJson(jsonDecode(jsonEncode(value)));
      Map<String, dynamic> orders = jsonDecode(jsonEncode(value));
      orders.remove('address');
      orders.remove('id');
      orders.remove('paid');
      orders.remove('uid');
      orders.remove('totalAmount');
      orders.forEach((k, v) {
        Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
        vc.forEach((key, value) {
          Product product = Product.fromJson(jsonDecode(jsonEncode(value)));
          if (rawNonVegOrder.ordersMap == null)
            rawNonVegOrder.ordersMap = {product.sellerId: product};
          else
            rawNonVegOrder.ordersMap.addAll({product.sellerId: product});
        });
      });
      combo.addAll({rawNonVegOrder.id: rawNonVegOrder});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in post combo Request");
      print(e);
      throw e;
    }
  }

  @action
  getComboOrders() async {
    if (combo.isEmpty) {
      isLoading = true;
      try {
        Map<String, dynamic> response =
            await orderService.getOrderDataMap('combo');
        print("reponse in combo order store");
        print(response);
        response.forEach((key, value) {
          Order rawNonVegOrder = Order.fromJson(jsonDecode(jsonEncode(value)));
          Map<String, dynamic> orders = jsonDecode(jsonEncode(value));
          orders.remove('address');
          orders.remove('id');
          orders.remove('paid');
          orders.remove('uid');
          orders.remove('totalAmount');
          orders.forEach((k, v) {
            Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
            vc.forEach((key, value) {
              Product product = Product.fromJson(jsonDecode(jsonEncode(value)));
              if (rawNonVegOrder.ordersMap == null)
                rawNonVegOrder.ordersMap = {product.sellerId: product};
              else
                rawNonVegOrder.ordersMap.addAll({product.sellerId: product});
            });
          });
          combo.addAll({rawNonVegOrder.id: rawNonVegOrder});
        });
        isLoading = false;
      } catch (e) {
        print("error in combo order store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }
}
