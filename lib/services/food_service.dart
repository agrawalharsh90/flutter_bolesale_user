import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/food_restaurant.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/utils/globals.dart';

class FoodService {
  FoodService._();

  factory FoodService.getInstance() => _instance;
  static final FoodService _instance = FoodService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, FoodRestaurant>> getFoodData() async {
    User user = await preferenceService.getAuthUser();

    QuerySnapshot querySnapshot = await _firestore
        .collection('/${user.city}/categories/food')
        .getDocuments();
    Map<String, FoodRestaurant> restaurantList = Map<String, FoodRestaurant>();
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.data != null) {
        FoodRestaurant items = FoodRestaurant.fromJson(
            jsonDecode(jsonEncode(documentSnapshot.data)));
        String key = documentSnapshot.documentID;
        restaurantList.addAll({key: items});
      }
    });
    return restaurantList;
  }
}
