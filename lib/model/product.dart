import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends _Product with _$Product {
  static Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  static Map<String, dynamic> toJson(Product user) => _$ProductToJson(user);
}

abstract class _Product with Store {
  @observable
  @JsonKey(name: 'Id')
  String sellerId;

  @observable
  String productID;

  @observable
  String brand;

  @observable
  String category;

  @observable
  String dispatch;

  @observable
  String description;

  @observable
  String material;

  @observable
  String moq;

  @observable
  String mrp;

  @observable
  String origin;

  @observable
  String price;

  @observable
  String product;

  @observable
  String stock;

  @observable
  String sub_category;

  @observable
  String warrenty;

  @observable
  int quantity;

  @observable
  List<String> productImage;
}
