// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return Vendor()
    ..id = json['id'] as String
    ..imageUrl = json['imageUrl'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..rating = json['rating'] as String
    ..phone = json['phone'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'email': instance.email,
      'rating': instance.rating,
      'phone': instance.phone,
      'address': instance.address,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Vendor on _Vendor, Store {
  final _$idAtom = Atom(name: '_Vendor.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$imageUrlAtom = Atom(name: '_Vendor.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.context.enforceReadPolicy(_$imageUrlAtom);
    _$imageUrlAtom.reportObserved();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.context.conditionallyRunInAction(() {
      super.imageUrl = value;
      _$imageUrlAtom.reportChanged();
    }, _$imageUrlAtom, name: '${_$imageUrlAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_Vendor.name');

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

  final _$emailAtom = Atom(name: '_Vendor.email');

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

  final _$ratingAtom = Atom(name: '_Vendor.rating');

  @override
  String get rating {
    _$ratingAtom.context.enforceReadPolicy(_$ratingAtom);
    _$ratingAtom.reportObserved();
    return super.rating;
  }

  @override
  set rating(String value) {
    _$ratingAtom.context.conditionallyRunInAction(() {
      super.rating = value;
      _$ratingAtom.reportChanged();
    }, _$ratingAtom, name: '${_$ratingAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_Vendor.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$addressAtom = Atom(name: '_Vendor.address');

  @override
  String get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }
}
