import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/product.dart';

class GetProductService {
  GetProductService._();

  factory GetProductService.getInstance() => _instance;
  static final GetProductService _instance = GetProductService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, List<Product>>> getProductList(
      {String collectionName}) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).getDocuments();
    Map<String, List<Product>> productList = Map<String, List<Product>>();
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      List<Product> items = List<Product>();
      print("product");
      if (documentSnapshot.data != null) {
        List data = documentSnapshot.data['items'];
        print("######");
        print(documentSnapshot.documentID);
        print(documentSnapshot.data);
        data.forEach((value) {
          print("*******");
          print(value);
          items.add(Product.fromJson(jsonDecode(jsonEncode(value))));
        });
      }
      String key = documentSnapshot.documentID;
      productList.addAll({key: items});
    });
    return productList;
  }
}
