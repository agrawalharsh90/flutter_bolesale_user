import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/model/offer.dart';

class OfferService {
  OfferService._();

  factory OfferService.getInstance() => _instance;
  static final OfferService _instance = OfferService._();
  Firestore _firestore = Firestore.instance;

  Future<Map<String, Offer>> getOffers() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('offers').getDocuments();
    Map<String, Offer> offers = Map<String, Offer>();
    querySnapshot.documents.forEach((DocumentSnapshot documentSnapshot) {
      String key = documentSnapshot.documentID;
      Offer offer =
          Offer.fromJson(jsonDecode(jsonEncode(documentSnapshot.data)));
      offer.id = key;
      offers.addAll({key: offer});
    });
    return offers;
  }
}
