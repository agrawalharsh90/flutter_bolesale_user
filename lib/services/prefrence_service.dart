import 'dart:convert';

import 'package:grocery/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;

  static final PreferenceService _instance = PreferenceService._();

  static const String UID = 'UID';
  static const String LOGGED_IN_USER = 'LOGGED_IN_USER';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setUID(String token) async {
    (await _getInstance()).setString(PreferenceService.UID, token);
  }

  Future<String> getUID() async {
    return (await _getInstance()).getString(PreferenceService.UID);
  }

  Future<void> removeUID() async {
    (await _getInstance()).setString(PreferenceService.UID, null);
  }

  Future<void> setAuthUser(User user) async {
    (await _getInstance()).setString(
        PreferenceService.LOGGED_IN_USER, json.encode(User.toJson(user)));
  }

  Future<void> removeAuthUser() async {
    (await _getInstance()).setString(PreferenceService.LOGGED_IN_USER, null);
  }

  Future<User> getAuthUser() async {
    final String user =
        (await _getInstance()).getString(PreferenceService.LOGGED_IN_USER);
    if (user == null) {
      return null;
    }
    return User.fromJson(json.decode(user));
  }
}
