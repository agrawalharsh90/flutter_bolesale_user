import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/utils/globals.dart';

class GetWorkerService {
  GetWorkerService._();

  factory GetWorkerService.getInstance() => _instance;
  static final GetWorkerService _instance = GetWorkerService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, List<Vendor>>> getWorkerList(
      {String collectionName,
      String dataListKey = 'items',
      String documentId}) async {
    User user = await preferenceService.getAuthUser();
    QuerySnapshot querySnapshot = await _firestore
        .collection('/${user.city}/categories/$collectionName')
        .getDocuments();
    Map<String, List<Vendor>> helpingHands = Map<String, List<Vendor>>();
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      List<Vendor> items = List<Vendor>();
      if (documentSnapshot.data != null) {
        List data = documentSnapshot.data[dataListKey];
        data.forEach((value) {
          items.add(Vendor.fromJson(jsonDecode(jsonEncode(value))));
        });
      }
      String key = documentSnapshot.documentID;
      helpingHands.addAll({key: items});
    });
    return helpingHands;
  }

  Future<Map<String, Vendor>> getVendors(
      {String collectionName, String documentId}) async {
    User user = await preferenceService.getAuthUser();

    DocumentSnapshot documentSnapshot = await _firestore
        .collection('/${user.city}/categories/$collectionName')
        .document(documentId)
        .get();
    Map<String, Vendor> vendorsMap = Map<String, Vendor>();
    if (documentSnapshot.data != null) {
      documentSnapshot.data.remove('name');
      documentSnapshot.data.forEach((k, value) {
        vendorsMap.addAll({k: Vendor.fromJson(jsonDecode(jsonEncode(value)))});
      });
    }
    return vendorsMap;
  }
}
