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
    ..role = _$enumDecodeNullable(_$RoleEnumMap, json['role'])
    ..imgUrl = json['imgUrl'] as String
    ..email = json['email'] as String
    ..createdAt = json['createdAt'] as String
    ..lastLoggedIn = json['lastLoggedIn'] as String
    ..deviceToken = json['deviceToken'] as String
    ..city = json['city'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'role': _$RoleEnumMap[instance.role],
      'imgUrl': instance.imgUrl,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'lastLoggedIn': instance.lastLoggedIn,
      'deviceToken': instance.deviceToken,
      'city': instance.city,
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

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.vendor: 'vendor',
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

  final _$roleAtom = Atom(name: '_User.role');

  @override
  Role get role {
    _$roleAtom.context.enforceReadPolicy(_$roleAtom);
    _$roleAtom.reportObserved();
    return super.role;
  }

  @override
  set role(Role value) {
    _$roleAtom.context.conditionallyRunInAction(() {
      super.role = value;
      _$roleAtom.reportChanged();
    }, _$roleAtom, name: '${_$roleAtom.name}_set');
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

  final _$cityAtom = Atom(name: '_User.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }
}
