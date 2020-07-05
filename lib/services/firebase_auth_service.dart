import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:grocery/model/user.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  factory FirebaseAuthService.getInstance() => _instance;
  static final FirebaseAuthService _instance = FirebaseAuthService._();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  verifyPhoneNumber(
      {String phoneNumber,
      Function codeSentCallBack,
      Function codeAutoRetrievalTimeout,
      Function verificationFailed,
      Function verificationComplete}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 5),
          verificationCompleted: verificationComplete,
          verificationFailed: verificationFailed,
          codeSent: codeSentCallBack,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print("error in phone auth");
      print(e);
      throw e;
    }
  }

  Future<User> verifyOTP({AuthCredential authCredential}) async {
    try {
      var result =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      var signedInUser = result.user;
      print("in verify otp");
      String token = await firebaseMessaging.getToken();
      Map<String, dynamic> value = {
        'uid': signedInUser.uid,
        'phoneNumber': signedInUser.phoneNumber,
        'createdAt': DateTime.now().toString(),
        'lastLoggedIn': DateTime.now().toString(),
        'deviceToken': token,
      };
      print(value);
      User user = User.fromJson(value);
      return user;
    } catch (e) {
      print("error in verify otp");
      print(e);
      throw e;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("error in signout");
      print(e);
      return false;
    }
  }
}
