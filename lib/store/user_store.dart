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
  User loggedInUser;

  @action
  loginWithGoogle() async {
    isLoading = true;
    try {
      FirebaseUser firebaseUser =
          await GoogleService.getInstance().signInWithGoogle();
      String token = await firebaseMessaging.getToken();
      Map<String, dynamic> value = {
        'uid': firebaseUser.uid,
        'photoUrl': firebaseUser.photoUrl,
        'email': firebaseUser.email,
        'phoneNumber': firebaseUser.phoneNumber,
        'displayName': firebaseUser.displayName,
        'createdAt': DateTime.now().toString(),
        'lastLoggedIn': DateTime.now().toString(),
        'deviceToken': token,
      };
      User user = User.fromJson(value);
      user = await createUser(user);
      return user;
    } catch (e) {
      isLoading = false;
      throw e;
    }
  }

  @action
  updatedUser({User user, File imageFile}) async {
    isLoading = true;
    if (imageFile != null) {
      String url = await firebaseService.uploadFile(
          folderName: 'user_profile', fileName: user.uid, file: imageFile);
      user.imgUrl = url;
    }
    await userService.updateUser(user: user);
    await preferenceService.setAuthUser(user);
    loggedInUser = user;
    isLoading = false;
  }

  @action
  createUser(User user) async {
    isLoading = true;
    user = await userService.setUser(user: user);
    setLoggedIn(user);
    return user;
  }

  @action
  setLoggedIn(User user) async {
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
