import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';
import 'package:http/http.dart' as http;

class OrderService {
  OrderService._();

  factory OrderService.getInstance() => _instance;
  static final OrderService _instance = OrderService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, dynamic>> postOrders(Map<String, dynamic> body) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    DocumentReference documentReference =
        await _firestore.collection('orders').document(id);
    LoggedInUser user = await preferenceService.getAuthUser();
    body.addAll({
      'id': id,
      'uid': user.uid,
      'createdAt': DateTime.now().toString(),
    });
    DocumentSnapshot data = await documentReference.get();
    if (data.exists) {
      await documentReference.updateData(body);
    } else {
      await documentReference.setData(body);
    }
    await sentEmail(user, id);

    return body;
  }

  Future<Map<String, dynamic>> getOrderDataMap() async {
    String uid = await preferenceService.getUID();

    QuerySnapshot querySnapshot = await _firestore
        .collection('orders')
        .where("uid", isEqualTo: uid)
        .getDocuments();

    Map<String, dynamic> dataMap = new Map();
    if (querySnapshot.documents.isNotEmpty) {
      querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
        dataMap.addAll({
          documentSnapshot.documentID:
              jsonDecode(jsonEncode(documentSnapshot.data))
        });
      });
    }
    return dataMap;
  }

  Future sentEmail(LoggedInUser user, String id) async {
    try {
      print("Send Mail");
      String url = 'https://mail-infinite.herokuapp.com/details';
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      request.fields["emailfrom"] = "bolesale@gmail.com";
      request.fields["emailto"] = user.email;
      request.fields["subject"] = "Order Successful";
      request.fields["text"] =
          "Your Order Id : $id \n\nYour order will be reach soon at your door step. \n\nThanks for shopping.";

      var response = await request.send();
      print(response.statusCode);
      print(response.request);
      print(request.fields);
      if (response.statusCode == 200) print('mail sent!');
    } catch (e) {
      print("error in sending mail");
      print(e);
    }
  }
}
