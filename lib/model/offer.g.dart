// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer()
    ..id = json['id'] as String
    ..description = json['description'] as String
    ..offerUrl = json['offerUrl'] as String
    ..code = json['code'] as String
    ..type = _$enumDecodeNullable(_$DiscountTypeEnumMap, json['type'])
    ..value = json['value'] as String;
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'offerUrl': instance.offerUrl,
      'code': instance.code,
      'type': _$DiscountTypeEnumMap[instance.type],
      'value': instance.value,
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

const _$DiscountTypeEnumMap = {
  DiscountType.amount: 'amount',
  DiscountType.percentage: 'percentage',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Offer on _Offer, Store {
  final _$idAtom = Atom(name: '_Offer.id');

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

  final _$descriptionAtom = Atom(name: '_Offer.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$offerUrlAtom = Atom(name: '_Offer.offerUrl');

  @override
  String get offerUrl {
    _$offerUrlAtom.context.enforceReadPolicy(_$offerUrlAtom);
    _$offerUrlAtom.reportObserved();
    return super.offerUrl;
  }

  @override
  set offerUrl(String value) {
    _$offerUrlAtom.context.conditionallyRunInAction(() {
      super.offerUrl = value;
      _$offerUrlAtom.reportChanged();
    }, _$offerUrlAtom, name: '${_$offerUrlAtom.name}_set');
  }

  final _$codeAtom = Atom(name: '_Offer.code');

  @override
  String get code {
    _$codeAtom.context.enforceReadPolicy(_$codeAtom);
    _$codeAtom.reportObserved();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.context.conditionallyRunInAction(() {
      super.code = value;
      _$codeAtom.reportChanged();
    }, _$codeAtom, name: '${_$codeAtom.name}_set');
  }

  final _$typeAtom = Atom(name: '_Offer.type');

  @override
  DiscountType get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(DiscountType value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_Offer.value');

  @override
  String get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }
}
