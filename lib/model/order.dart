import 'package:grocery/model/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends _Order with _$Order {
  static Order fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static Map<String, dynamic> toJson(Order order) => _$OrderToJson(order);
}

abstract class _Order with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String address;

  @observable
  double totalAmount;

  @observable
  bool paid;

  @observable
  Map<String, Product> ordersMap;
}
