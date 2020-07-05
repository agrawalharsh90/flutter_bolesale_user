import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class UserService {
  UserService._();

  factory UserService.getInstance() => _instance;
  static final UserService _instance = UserService._();
  Firestore _firestore = Firestore.instance;

  Future<User> getUser() async {
    String uid = await preferenceService.getUID();
    print(uid);
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('user_details').document(uid).get();
    print(documentSnapshot.data);
    User user = User.fromJson(documentSnapshot.data);
    return user;
  }

  Future<User> setUser({User user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').document(user.uid);
    var data = User.toJson(user);
    try {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        print("User exist");
        User data = User.fromJson(documentSnapshot.data);
        data.lastLoggedIn = user.lastLoggedIn;
        data.deviceToken = user.deviceToken;
        await documentReference.updateData(User.toJson(data));
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

  Future<void> updateUser({User user}) async {
    DocumentReference documentReference =
        _firestore.collection('user_details').document(user.uid);
    var data = User.toJson(user);
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
