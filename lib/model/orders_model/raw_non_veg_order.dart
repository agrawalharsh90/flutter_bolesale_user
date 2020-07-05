import 'package:grocery/model/product.dart';
import 'package:grocery/model/vendor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'raw_non_veg_order.g.dart';

@JsonSerializable()
class RawNonVegOrder extends _RawNonVegOrder with _$RawNonVegOrder {
  static RawNonVegOrder fromJson(Map<String, dynamic> json) =>
      _$RawNonVegOrderFromJson(json);

  static Map<String, dynamic> toJson(RawNonVegOrder rawNonVegOrder) =>
      _$RawNonVegOrderToJson(rawNonVegOrder);
}

abstract class _RawNonVegOrder with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String vendorId;

  @observable
  String address;

  @observable
  double totalAmount;

  @observable
  bool wantsVideoCall;

  @observable
  bool paid;

  @observable
  bool videoCallCompleted;

  @observable
  String videoCallTime;

  @observable
  String videoCallId;

  @observable
  Vendor vendor;

  @observable
  Map<String, Product> ordersMap;
}
