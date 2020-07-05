import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/model/user.dart';
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
  bool isCodeSent = false;

  @observable
  bool isCodeAutoReceived = false;

  @observable
  User loggedInUser;

  @observable
  String verfId;

  @action
  sendOTP(
      {String phoneNumber,
      Function verificationFailed,
      Function verificationComplete}) async {
    isLoading = true;
    try {
      firebaseAuthService.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          codeSentCallBack: (String id, [int forceCodeSend]) {
            print("code sent");
            print(id);
            print(forceCodeSend);
            verfId = id;
            isCodeSent = true;
            isLoading = false;
          },
          verificationComplete: (AuthCredential authCredential) async {
            print("auto verification complete");
            isCodeAutoReceived = true;
            isLoading = true;
            User response = await firebaseAuthService.verifyOTP(
                authCredential: authCredential);
            createUser(response);
          },
          codeAutoRetrievalTimeout: (String id) {
            print("code auto retrieval");
            print(id);
            verfId = id;
            isCodeSent = true;
            isLoading = false;
          },
          verificationFailed: (AuthException exception) {
            print("verification failed");
            print(exception.message);
            isLoading = false;
            verificationFailed(exception);
            throw exception;
          });
    } catch (e) {
      print(e);
      isLoading = false;
      throw e;
    }
  }

  @action
  verifyOTP({String otp}) async {
    isLoading = true;
    try {
      AuthCredential authCredential =
          PhoneAuthProvider.getCredential(verificationId: verfId, smsCode: otp);
      User response =
          await firebaseAuthService.verifyOTP(authCredential: authCredential);
      createUser(response);
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
    if (user.city == null) user.city = 'Patna';
    await userService.updateUser(user: user);
    await preferenceService.setAuthUser(user);
    loggedInUser = user;
    isLoading = false;
  }

  @action
  createUser(User user) async {
    isLoading = true;
    user = await userService.setUser(user: user);
    if (user.city == null) user.city = 'Patna';
    setLoggedIn(user);
    isLoading = false;
  }

  @action
  setLoggedIn(User user) async {
    print("set login user");
    await preferenceService.setAuthUser(user);
    await preferenceService.setUID(user.uid);
    loggedInUser = user;
    isLoggedIn = true;
  }

  @action
  logout() async {
    isLoading = true;
    firebaseAuthService.signOut();
    isLoggedIn = false;
    loggedInUser = null;
    isCodeSent = false;
    isCodeAutoReceived = false;
    await preferenceService.removeUID();
    await preferenceService.removeAuthUser();
    isLoading = false;
  }
}
