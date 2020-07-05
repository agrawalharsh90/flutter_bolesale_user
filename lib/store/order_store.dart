import 'dart:convert';

import 'package:grocery/model/orders_model/raw_non_veg_order.dart';
import 'package:grocery/model/orders_model/vendor_request.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Map<String, VendorRequest> helpingHands =
      ObservableMap<String, VendorRequest>();

  @observable
  Map<String, VendorRequest> water = ObservableMap<String, VendorRequest>();

  @observable
  Map<String, RawNonVegOrder> rawNonVeg =
      ObservableMap<String, RawNonVegOrder>();
  @observable
  Map<String, RawNonVegOrder> combo = ObservableMap<String, RawNonVegOrder>();

  @action
  postWaterRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> reponse =
          await orderService.postOrders(data, 'water');
      VendorRequest vendorRequest = VendorRequest.fromJson(reponse);
      water.addAll({vendorRequest.id: vendorRequest});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in post Water Request");
      print(e);
      throw e;
    }
  }

  @action
  postHelpingHandRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> reponse =
          await orderService.postOrders(data, 'helping_hands');
      VendorRequest vendorRequest = VendorRequest.fromJson(reponse);
      helpingHands.addAll({vendorRequest.id: vendorRequest});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in post helping_hands Request");
      print(e);
      throw e;
    }
  }

  @action
  postRawNonVegRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> value =
          await orderService.postOrders(data, 'raw_non_veg');
      RawNonVegOrder rawNonVegOrder =
          RawNonVegOrder.fromJson(jsonDecode(jsonEncode(value)));
      var orders = value['orders'];
      orders.forEach((v) {
        Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
        Product product =
            Product.fromJson(jsonDecode(jsonEncode(vc.values.toList()[0])));
        if (rawNonVegOrder.ordersMap == null)
          rawNonVegOrder.ordersMap = {product.name: product};
        else
          rawNonVegOrder.ordersMap.addAll({product.name: product});
      });
      rawNonVeg.addAll({rawNonVegOrder.id: rawNonVegOrder});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in post raw_non_veg Request");
      print(e);
      throw e;
    }
  }

  @action
  postComboRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> value = await orderService.postOrders(data, 'combo');
      RawNonVegOrder rawNonVegOrder =
          RawNonVegOrder.fromJson(jsonDecode(jsonEncode(value)));
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
            rawNonVegOrder.ordersMap = {product.name: product};
          else
            rawNonVegOrder.ordersMap.addAll({product.name: product});
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
  getHelpingHandsData() async {
    if (helpingHands.isEmpty) {
      isLoading = true;
      try {
        Map<String, VendorRequest> response =
            await orderService.getVendorsRequests('helping_hands');
        print("reponse in helping hand order store");
        print(response);
        helpingHands.addAll(response);
        isLoading = false;
      } catch (e) {
        print("error in helping hand order store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }

  @action
  getWaterData() async {
    if (water.isEmpty) {
      isLoading = true;
      try {
        Map<String, VendorRequest> response =
            await orderService.getVendorsRequests('water');
        print("reponse in water order store");
        print(response);
        water.addAll(response);
        isLoading = false;
      } catch (e) {
        print("error in water order store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }

  @action
  getRawNonVeg() async {
    if (rawNonVeg.isEmpty) {
      isLoading = true;
      try {
        Map<String, dynamic> response =
            await orderService.getOrderDataMap('raw_non_veg');
        print("reponse in raw non veg order store");
        print(response);
        response.forEach((key, value) {
          RawNonVegOrder rawNonVegOrder =
              RawNonVegOrder.fromJson(jsonDecode(jsonEncode(value)));
          var orders = value['orders'];
          orders.forEach((v) {
            Map<String, dynamic> vc = jsonDecode(jsonEncode(v));
            Product product =
                Product.fromJson(jsonDecode(jsonEncode(vc.values.toList()[0])));
            if (rawNonVegOrder.ordersMap == null)
              rawNonVegOrder.ordersMap = {product.name: product};
            else
              rawNonVegOrder.ordersMap.addAll({product.name: product});
          });
          rawNonVeg.addAll({rawNonVegOrder.id: rawNonVegOrder});
        });
        isLoading = false;
      } catch (e) {
        print("error in raw non veg order store");
        print(e);
        isLoading = false;
        throw e;
      }
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
          RawNonVegOrder rawNonVegOrder =
              RawNonVegOrder.fromJson(jsonDecode(jsonEncode(value)));
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
                rawNonVegOrder.ordersMap = {product.name: product};
              else
                rawNonVegOrder.ordersMap.addAll({product.name: product});
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
