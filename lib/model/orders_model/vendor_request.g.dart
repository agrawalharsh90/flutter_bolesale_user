// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorRequest _$VendorRequestFromJson(Map<String, dynamic> json) {
  return VendorRequest()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..liters = json['liters'] as String
    ..category = json['category'] as String
    ..vendor = json['vendor'] == null
        ? null
        : Vendor.fromJson(json['vendor'] as Map<String, dynamic>);
}

Map<String, dynamic> _$VendorRequestToJson(VendorRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'liters': instance.liters,
      'category': instance.category,
      'vendor': instance.vendor,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VendorRequest on _VendorRequest, Store {
  final _$idAtom = Atom(name: '_VendorRequest.id');

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

  final _$uidAtom = Atom(name: '_VendorRequest.uid');

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

  final _$litersAtom = Atom(name: '_VendorRequest.liters');

  @override
  String get liters {
    _$litersAtom.context.enforceReadPolicy(_$litersAtom);
    _$litersAtom.reportObserved();
    return super.liters;
  }

  @override
  set liters(String value) {
    _$litersAtom.context.conditionallyRunInAction(() {
      super.liters = value;
      _$litersAtom.reportChanged();
    }, _$litersAtom, name: '${_$litersAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_VendorRequest.category');

  @override
  String get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$vendorAtom = Atom(name: '_VendorRequest.vendor');

  @override
  Vendor get vendor {
    _$vendorAtom.context.enforceReadPolicy(_$vendorAtom);
    _$vendorAtom.reportObserved();
    return super.vendor;
  }

  @override
  set vendor(Vendor value) {
    _$vendorAtom.context.conditionallyRunInAction(() {
      super.vendor = value;
      _$vendorAtom.reportChanged();
    }, _$vendorAtom, name: '${_$vendorAtom.name}_set');
  }
}
