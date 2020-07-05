import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/medical.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class MedicalService {
  MedicalService._();

  factory MedicalService.getInstance() => _instance;
  static final MedicalService _instance = MedicalService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, Medical>> getMedicalData() async {
    User user = await preferenceService.getAuthUser();
    QuerySnapshot querySnapshot = await _firestore
        .collection('/orders/medical/data')
        .where('uid', isEqualTo: user.uid)
        .getDocuments();

    Map<String, Medical> medicalData = new Map();
    if (querySnapshot.documents.isNotEmpty) {
      querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
        Medical medical =
            Medical.fromJson(jsonDecode(jsonEncode(documentSnapshot.data)));
        medicalData.addAll({medical.id: medical});
      });
    }
    return medicalData;
  }

//  Future updateMedicalData({Medical medical}) async {
//    String uid = await preferenceService.getUID();
//    DocumentReference documentReference =
//        _firestore.collection('order/''medical').document(uid);
//    var medicalData = {medical.id: Medical.toJson(medical)};
//    try {
//      DocumentSnapshot documentSnapshot = await documentReference.get();
//      if (documentSnapshot.exists) {
//        documentReference.updateData(medicalData);
//        print("Medical data updated");
//      } else {
//        await documentReference.setData(medicalData);
//        print("Medical data added");
//      }
//    } catch (e) {
//      print("error in service");
//      print(e);
//      throw e;
//    }
//  }
}
