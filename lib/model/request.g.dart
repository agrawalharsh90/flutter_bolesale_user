// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..orderId = json['orderId'] as String
    ..reason = json['reason'] as String
    ..requestType =
        _$enumDecodeNullable(_$RequestTypeEnumMap, json['requestType']);
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'orderId': instance.orderId,
      'reason': instance.reason,
      'requestType': _$RequestTypeEnumMap[instance.requestType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RequestTypeEnumMap = {
  RequestType.Return: 'Return',
  RequestType.Cancel: 'Cancel',
  RequestType.Exchange: 'Exchange',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Request on _Request, Store {
  final _$idAtom = Atom(name: '_Request.id');

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

  final _$uidAtom = Atom(name: '_Request.uid');

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

  final _$orderIdAtom = Atom(name: '_Request.orderId');

  @override
  String get orderId {
    _$orderIdAtom.context.enforceReadPolicy(_$orderIdAtom);
    _$orderIdAtom.reportObserved();
    return super.orderId;
  }

  @override
  set orderId(String value) {
    _$orderIdAtom.context.conditionallyRunInAction(() {
      super.orderId = value;
      _$orderIdAtom.reportChanged();
    }, _$orderIdAtom, name: '${_$orderIdAtom.name}_set');
  }

  final _$reasonAtom = Atom(name: '_Request.reason');

  @override
  String get reason {
    _$reasonAtom.context.enforceReadPolicy(_$reasonAtom);
    _$reasonAtom.reportObserved();
    return super.reason;
  }

  @override
  set reason(String value) {
    _$reasonAtom.context.conditionallyRunInAction(() {
      super.reason = value;
      _$reasonAtom.reportChanged();
    }, _$reasonAtom, name: '${_$reasonAtom.name}_set');
  }

  final _$requestTypeAtom = Atom(name: '_Request.requestType');

  @override
  RequestType get requestType {
    _$requestTypeAtom.context.enforceReadPolicy(_$requestTypeAtom);
    _$requestTypeAtom.reportObserved();
    return super.requestType;
  }

  @override
  set requestType(RequestType value) {
    _$requestTypeAtom.context.conditionallyRunInAction(() {
      super.requestType = value;
      _$requestTypeAtom.reportChanged();
    }, _$requestTypeAtom, name: '${_$requestTypeAtom.name}_set');
  }
}
