import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable()
class LoggedInUser extends _LoggedInUser with _$LoggedInUser {
  static LoggedInUser fromJson(Map<String, dynamic> json) => _$LoggedInUserFromJson(json);

  static Map<String, dynamic> toJson(LoggedInUser loggedInUser) => _$LoggedInUserToJson(loggedInUser);
}

abstract class _LoggedInUser with Store {
  @observable
  String uid;

  @observable
  String name;

  @observable
  String phoneNumber;

  @observable
  String referralSellerId;

  @observable
  String imgUrl;

  @observable
  String email;

  @observable
  String createdAt;

  @observable
  String lastLoggedIn;

  @observable
  String deviceToken;
}
