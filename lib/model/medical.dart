import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'medical.g.dart';

@JsonSerializable()
class Medical extends _Medical with _$Medical {
  static Medical fromJson(Map<String, dynamic> json) => _$MedicalFromJson(json);

  static Map<String, dynamic> toJson(Medical medical) =>
      _$MedicalToJson(medical);
}

abstract class _Medical with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String prescriptionUrl;

  @observable
  String reportUrl;
}
