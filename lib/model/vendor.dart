import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'vendor.g.dart';

@JsonSerializable()
class Vendor extends _Vendor with _$Vendor {
  static Vendor fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  static Map<String, dynamic> toJson(Vendor user) => _$VendorToJson(user);
}

abstract class _Vendor with Store {
  @observable
  String id;

  @observable
  String imageUrl;

  @observable
  String name;

  @observable
  String email;

  @observable
  String rating;

  @observable
  String phone;

  @observable
  String address;
}
