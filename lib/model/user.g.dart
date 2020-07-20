// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..uid = json['uid'] as String
    ..name = json['name'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..referralSellerId = json['referralSellerId'] as String
    ..imgUrl = json['imgUrl'] as String
    ..email = json['email'] as String
    ..createdAt = json['createdAt'] as String
    ..lastLoggedIn = json['lastLoggedIn'] as String
    ..deviceToken = json['deviceToken'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'referralSellerId': instance.referralSellerId,
      'imgUrl': instance.imgUrl,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'lastLoggedIn': instance.lastLoggedIn,
      'deviceToken': instance.deviceToken,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _User, Store {
  final _$uidAtom = Atom(name: '_User.uid');

  @override
  String get uid {
    _$uidAtom.context.enforceReadPolicy(_$uidAtom);
    _$uidAtom.reportObserved();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.context.conditionallyRunInAction(() {
      super.uid = value;
      _$uidAtom.reportChanged();
    }, _$uidAtom, name: '${_$uidAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_User.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$phoneNumberAtom = Atom(name: '_User.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.context.enforceReadPolicy(_$phoneNumberAtom);
    _$phoneNumberAtom.reportObserved();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.context.conditionallyRunInAction(() {
      super.phoneNumber = value;
      _$phoneNumberAtom.reportChanged();
    }, _$phoneNumberAtom, name: '${_$phoneNumberAtom.name}_set');
  }

  final _$referralSellerIdAtom = Atom(name: '_User.referralSellerId');

  @override
  String get referralSellerId {
    _$referralSellerIdAtom.context.enforceReadPolicy(_$referralSellerIdAtom);
    _$referralSellerIdAtom.reportObserved();
    return super.referralSellerId;
  }

  @override
  set referralSellerId(String value) {
    _$referralSellerIdAtom.context.conditionallyRunInAction(() {
      super.referralSellerId = value;
      _$referralSellerIdAtom.reportChanged();
    }, _$referralSellerIdAtom, name: '${_$referralSellerIdAtom.name}_set');
  }

  final _$imgUrlAtom = Atom(name: '_User.imgUrl');

  @override
  String get imgUrl {
    _$imgUrlAtom.context.enforceReadPolicy(_$imgUrlAtom);
    _$imgUrlAtom.reportObserved();
    return super.imgUrl;
  }

  @override
  set imgUrl(String value) {
    _$imgUrlAtom.context.conditionallyRunInAction(() {
      super.imgUrl = value;
      _$imgUrlAtom.reportChanged();
    }, _$imgUrlAtom, name: '${_$imgUrlAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_User.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$createdAtAtom = Atom(name: '_User.createdAt');

  @override
  String get createdAt {
    _$createdAtAtom.context.enforceReadPolicy(_$createdAtAtom);
    _$createdAtAtom.reportObserved();
    return super.createdAt;
  }

  @override
  set createdAt(String value) {
    _$createdAtAtom.context.conditionallyRunInAction(() {
      super.createdAt = value;
      _$createdAtAtom.reportChanged();
    }, _$createdAtAtom, name: '${_$createdAtAtom.name}_set');
  }

  final _$lastLoggedInAtom = Atom(name: '_User.lastLoggedIn');

  @override
  String get lastLoggedIn {
    _$lastLoggedInAtom.context.enforceReadPolicy(_$lastLoggedInAtom);
    _$lastLoggedInAtom.reportObserved();
    return super.lastLoggedIn;
  }

  @override
  set lastLoggedIn(String value) {
    _$lastLoggedInAtom.context.conditionallyRunInAction(() {
      super.lastLoggedIn = value;
      _$lastLoggedInAtom.reportChanged();
    }, _$lastLoggedInAtom, name: '${_$lastLoggedInAtom.name}_set');
  }

  final _$deviceTokenAtom = Atom(name: '_User.deviceToken');

  @override
  String get deviceToken {
    _$deviceTokenAtom.context.enforceReadPolicy(_$deviceTokenAtom);
    _$deviceTokenAtom.reportObserved();
    return super.deviceToken;
  }

  @override
  set deviceToken(String value) {
    _$deviceTokenAtom.context.conditionallyRunInAction(() {
      super.deviceToken = value;
      _$deviceTokenAtom.reportChanged();
    }, _$deviceTokenAtom, name: '${_$deviceTokenAtom.name}_set');
  }
}
