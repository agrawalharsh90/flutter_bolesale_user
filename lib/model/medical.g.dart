// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medical _$MedicalFromJson(Map<String, dynamic> json) {
  return Medical()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..prescriptionUrl = json['prescriptionUrl'] as String
    ..reportUrl = json['reportUrl'] as String;
}

Map<String, dynamic> _$MedicalToJson(Medical instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'prescriptionUrl': instance.prescriptionUrl,
      'reportUrl': instance.reportUrl,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Medical on _Medical, Store {
  final _$idAtom = Atom(name: '_Medical.id');

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

  final _$uidAtom = Atom(name: '_Medical.uid');

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

  final _$prescriptionUrlAtom = Atom(name: '_Medical.prescriptionUrl');

  @override
  String get prescriptionUrl {
    _$prescriptionUrlAtom.context.enforceReadPolicy(_$prescriptionUrlAtom);
    _$prescriptionUrlAtom.reportObserved();
    return super.prescriptionUrl;
  }

  @override
  set prescriptionUrl(String value) {
    _$prescriptionUrlAtom.context.conditionallyRunInAction(() {
      super.prescriptionUrl = value;
      _$prescriptionUrlAtom.reportChanged();
    }, _$prescriptionUrlAtom, name: '${_$prescriptionUrlAtom.name}_set');
  }

  final _$reportUrlAtom = Atom(name: '_Medical.reportUrl');

  @override
  String get reportUrl {
    _$reportUrlAtom.context.enforceReadPolicy(_$reportUrlAtom);
    _$reportUrlAtom.reportObserved();
    return super.reportUrl;
  }

  @override
  set reportUrl(String value) {
    _$reportUrlAtom.context.conditionallyRunInAction(() {
      super.reportUrl = value;
      _$reportUrlAtom.reportChanged();
    }, _$reportUrlAtom, name: '${_$reportUrlAtom.name}_set');
  }
}
