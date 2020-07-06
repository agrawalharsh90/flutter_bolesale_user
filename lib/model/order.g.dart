// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..address = json['address'] as String
    ..totalAmount = (json['totalAmount'] as num)?.toDouble()
    ..paid = json['paid'] as bool
    ..ordersMap = (json['ordersMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Product.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'address': instance.address,
      'totalAmount': instance.totalAmount,
      'paid': instance.paid,
      'ordersMap': instance.ordersMap,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Order on _Order, Store {
  final _$idAtom = Atom(name: '_Order.id');

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

  final _$uidAtom = Atom(name: '_Order.uid');

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

  final _$addressAtom = Atom(name: '_Order.address');

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

  final _$totalAmountAtom = Atom(name: '_Order.totalAmount');

  @override
  double get totalAmount {
    _$totalAmountAtom.context.enforceReadPolicy(_$totalAmountAtom);
    _$totalAmountAtom.reportObserved();
    return super.totalAmount;
  }

  @override
  set totalAmount(double value) {
    _$totalAmountAtom.context.conditionallyRunInAction(() {
      super.totalAmount = value;
      _$totalAmountAtom.reportChanged();
    }, _$totalAmountAtom, name: '${_$totalAmountAtom.name}_set');
  }

  final _$paidAtom = Atom(name: '_Order.paid');

  @override
  bool get paid {
    _$paidAtom.context.enforceReadPolicy(_$paidAtom);
    _$paidAtom.reportObserved();
    return super.paid;
  }

  @override
  set paid(bool value) {
    _$paidAtom.context.conditionallyRunInAction(() {
      super.paid = value;
      _$paidAtom.reportChanged();
    }, _$paidAtom, name: '${_$paidAtom.name}_set');
  }

  final _$ordersMapAtom = Atom(name: '_Order.ordersMap');

  @override
  Map<String, Product> get ordersMap {
    _$ordersMapAtom.context.enforceReadPolicy(_$ordersMapAtom);
    _$ordersMapAtom.reportObserved();
    return super.ordersMap;
  }

  @override
  set ordersMap(Map<String, Product> value) {
    _$ordersMapAtom.context.conditionallyRunInAction(() {
      super.ordersMap = value;
      _$ordersMapAtom.reportChanged();
    }, _$ordersMapAtom, name: '${_$ordersMapAtom.name}_set');
  }
}
