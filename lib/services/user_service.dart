import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class UserService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();
  Firestore _firestore = Firestore.instance;

  Future<LoggedInUser> getUser() async {
    String uid = await preferenceService.getUID();
    print(uid);
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('user_details').document(uid).get();
    print(documentSnapshot.data);
    LoggedInUser user = LoggedInUser.fromJson(documentSnapshot.data);
    return user;
  }

  Future<LoggedInUser> setUser({LoggedInUser user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').document(user.uid);
    var data = LoggedInUser.toJson(user);
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print("User exist");
        LoggedInUser data = LoggedInUser.fromJson(documentSnapshot.data);
        data.lastLoggedIn = user.lastLoggedIn;
        data.deviceToken = user.deviceToken;
        data.name = data.name ?? user.name;
        data.email = data.email ?? user.email;
        data.imgUrl = data.imgUrl ?? user.imgUrl;
        data.phoneNumber = data.phoneNumber ?? user.phoneNumber;
        await documentReference.updateData(LoggedInUser.toJson(data));
        user = data;
      } else {
        await documentReference.setData(data);
        print("User added");
      }
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUser({LoggedInUser user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').document(user.uid);
    var data = LoggedInUser.toJson(user);
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print(data);
        documentReference.updateData(data);
        print("User updated");
      } else {
        await documentReference.setData(data);
        print("User added");
      }
    } catch (e) {
      throw e;
    }
  }
}
