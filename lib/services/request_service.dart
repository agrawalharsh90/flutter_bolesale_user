import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/request.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class RequestService {
  RequestService._();

  factory RequestService.getInstance() => _instance;
  static final RequestService _instance = RequestService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, dynamic>> cancelReturnOrder(
      Map<String, dynamic> body) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    DocumentReference documentReference =
        await _firestore.collection('requests').document(id);
    User user = await preferenceService.getAuthUser();
    body.addAll({'id': id, 'uid': user.uid});
    await documentReference.setData(body);
    return body;
  }

  Future<Map<String, dynamic>> getAllRequets() async {
    User user = await preferenceService.getAuthUser();

    QuerySnapshot querySnapshot = await _firestore
        .collection('requests')
        .where("uid", isEqualTo: user.uid)
        .getDocuments();
    Map<String, Request> requestList = {};
    if (querySnapshot.documents.isNotEmpty) {
      querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
        requestList.addAll({
          documentSnapshot.documentID:
              Request.fromJson(jsonDecode(jsonEncode(documentSnapshot.data)))
        });
      });
    }
    return requestList;
  }
}
