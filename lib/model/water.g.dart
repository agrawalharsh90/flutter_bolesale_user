// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Water _$WaterFromJson(Map<String, dynamic> json) {
  return Water()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..vendorId = json['vendorId'] as String
    ..liters = json['liters'] as String
    ..dates = (json['dates'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$WaterToJson(Water instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'vendorId': instance.vendorId,
      'liters': instance.liters,
      'dates': instance.dates,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Water on _Water, Store {
  final _$idAtom = Atom(name: '_Water.id');

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

  final _$uidAtom = Atom(name: '_Water.uid');

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

  final _$vendorIdAtom = Atom(name: '_Water.vendorId');

  @override
  String get vendorId {
    _$vendorIdAtom.context.enforceReadPolicy(_$vendorIdAtom);
    _$vendorIdAtom.reportObserved();
    return super.vendorId;
  }

  @override
  set vendorId(String value) {
    _$vendorIdAtom.context.conditionallyRunInAction(() {
      super.vendorId = value;
      _$vendorIdAtom.reportChanged();
    }, _$vendorIdAtom, name: '${_$vendorIdAtom.name}_set');
  }

  final _$litersAtom = Atom(name: '_Water.liters');

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

  final _$datesAtom = Atom(name: '_Water.dates');

  @override
  List<String> get dates {
    _$datesAtom.context.enforceReadPolicy(_$datesAtom);
    _$datesAtom.reportObserved();
    return super.dates;
  }

  @override
  set dates(List<String> value) {
    _$datesAtom.context.conditionallyRunInAction(() {
      super.dates = value;
      _$datesAtom.reportChanged();
    }, _$datesAtom, name: '${_$datesAtom.name}_set');
  }
}
