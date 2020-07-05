import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'water.g.dart';

@JsonSerializable()
class Water extends _Water with _$Water {
  static Water fromJson(Map<String, dynamic> json) => _$WaterFromJson(json);

  static Map<String, dynamic> toJson(Water water) => _$WaterToJson(water);
}

abstract class _Water with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String vendorId;

  @observable
  String liters;

  @observable
  List<String> dates;
}
