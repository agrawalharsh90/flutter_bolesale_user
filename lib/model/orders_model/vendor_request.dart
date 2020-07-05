import 'package:grocery/model/vendor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'vendor_request.g.dart';

@JsonSerializable()
class VendorRequest extends _VendorRequest with _$VendorRequest {
  static VendorRequest fromJson(Map<String, dynamic> json) =>
      _$VendorRequestFromJson(json);

  static Map<String, dynamic> toJson(VendorRequest vendorRequest) =>
      _$VendorRequestToJson(vendorRequest);
}

abstract class _VendorRequest with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String liters;

  @observable
  String category;

  @observable
  Vendor vendor;
}
