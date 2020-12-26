import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/services/google_service.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  LoggedInUser loggedInUser;

  @action
  loginWithGoogle() async {
    isLoading = true;
    try {
      LoggedInUser loggedInUser =
          await GoogleService.getInstance().signInWithGoogle();
      String token = await firebaseMessaging.getToken();
      loggedInUser.deviceToken = token;
      print(LoggedInUser.toJson(loggedInUser));
      loggedInUser = await createUser(loggedInUser);
      print(LoggedInUser.toJson(loggedInUser));
    } catch (e) {
      isLoading = false;
      throw e;
    }
  }

  @action
  updatedUser({LoggedInUser user, File imageFile}) async {
    isLoading = true;
    if (imageFile != null) {
      String url = await firebaseService.uploadFile(
          folderName: 'user_profile', fileName: user.uid, file: imageFile);
      user.imgUrl = url;
    }
    await userService.updateUser(user: user);
    await setLoggedIn(user);
  }

  @action
  createUser(LoggedInUser user) async {
    isLoading = true;
    user = await userService.setUser(user: user);
    await setLoggedIn(user);
    return user;
  }

  @action
  setLoggedIn(LoggedInUser user) async {
    print("set login user");
    await preferenceService.setAuthUser(user);
    await preferenceService.setUID(user.uid);
    loggedInUser = user;
    isLoggedIn = true;
    isLoading = false;
  }

  @action
  logout() async {
    isLoading = true;
    GoogleService.getInstance().signOutGoogle();
    isLoggedIn = false;
    loggedInUser = null;
    await preferenceService.removeUID();
    await preferenceService.removeAuthUser();
    isLoading = false;
  }
}
