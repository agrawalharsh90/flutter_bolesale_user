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
  int id;

  @observable
  String imageUrl;

  @observable
  String name;

  @observable
  String description;

  @observable
  String category;

  @observable
  String city;

  @observable
  String type;

  @observable
  int quantity;

  @observable
  String price;
}
