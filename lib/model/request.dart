import 'package:grocery/model/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'request.g.dart';

@JsonSerializable()
class Request extends _Request with _$Request {
  static Request fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);

  static Map<String, dynamic> toJson(Request request) =>
      _$RequestToJson(request);
}

abstract class _Request with Store {
  @observable
  String id;

  @observable
  String uid;

  @observable
  String orderId;

  @observable
  String reason;

  @observable
  RequestType requestType;
}

enum RequestType { Return, Cancel, Exchange }
