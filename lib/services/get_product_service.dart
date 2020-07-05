import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class GetProductService {
  GetProductService._();

  factory GetProductService.getInstance() => _instance;
  static final GetProductService _instance = GetProductService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, List<Product>>> getProductList(
      {String collectionName}) async {
    User user = await preferenceService.getAuthUser();

    QuerySnapshot querySnapshot = await _firestore
        .collection('/${user.city}/categories/$collectionName')
        .getDocuments();
    Map<String, List<Product>> productList = Map<String, List<Product>>();
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.documentID != 'vendors') {
        List<Product> items = List<Product>();
        if (documentSnapshot.data != null) {
          List data = documentSnapshot.data['items'];
          data.forEach((value) {
            items.add(Product.fromJson(jsonDecode(jsonEncode(value))));
          });
        }
        String key = documentSnapshot.documentID;
        productList.addAll({key: items});
      }
    });
    return productList;
  }
}
