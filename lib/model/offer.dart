import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer extends _Offer with _$Offer {
  static Offer fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  static Map<String, dynamic> toJson(Offer Offer) => _$OfferToJson(Offer);
}

abstract class _Offer with Store {
  @observable
  String id;

  @observable
  String description;

  @observable
  String offerUrl;

  @observable
  String code;

  @observable
  DiscountType type;

  @observable
  String value;
}

enum DiscountType { amount, percentage }
