import 'package:grocery/model/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'food_restaurant.g.dart';

@JsonSerializable()
class FoodRestaurant extends _FoodRestaurant with _$FoodRestaurant {
  static FoodRestaurant fromJson(Map<String, dynamic> json) =>
      _$FoodRestaurantFromJson(json);

  static Map<String, dynamic> toJson(FoodRestaurant user) =>
      _$FoodRestaurantToJson(user);
}

abstract class _FoodRestaurant with Store {
  @observable
  String imageUrl;

  @observable
  String name;

  @observable
  String description;

  @observable
  String phone;

  @observable
  String rating;

  @observable
  String address;

  @observable
  List<Product> items;
}
