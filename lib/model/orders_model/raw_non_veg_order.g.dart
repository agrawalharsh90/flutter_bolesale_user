// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_non_veg_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawNonVegOrder _$RawNonVegOrderFromJson(Map<String, dynamic> json) {
  return RawNonVegOrder()
    ..id = json['id'] as String
    ..uid = json['uid'] as String
    ..vendorId = json['vendorId'] as String
    ..address = json['address'] as String
    ..totalAmount = (json['totalAmount'] as num)?.toDouble()
    ..wantsVideoCall = json['wantsVideoCall'] as bool
    ..paid = json['paid'] as bool
    ..videoCallCompleted = json['videoCallCompleted'] as bool
    ..videoCallTime = json['videoCallTime'] as String
    ..videoCallId = json['videoCallId'] as String
    ..vendor = json['vendor'] == null
        ? null
        : Vendor.fromJson(json['vendor'] as Map<String, dynamic>)
    ..ordersMap = (json['ordersMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Product.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$RawNonVegOrderToJson(RawNonVegOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'vendorId': instance.vendorId,
      'address': instance.address,
      'totalAmount': instance.totalAmount,
      'wantsVideoCall': instance.wantsVideoCall,
      'paid': instance.paid,
      'videoCallCompleted': instance.videoCallCompleted,
      'videoCallTime': instance.videoCallTime,
      'videoCallId': instance.videoCallId,
      'vendor': instance.vendor,
      'ordersMap': instance.ordersMap,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RawNonVegOrder on _RawNonVegOrder, Store {
  final _$idAtom = Atom(name: '_RawNonVegOrder.id');

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

  final _$uidAtom = Atom(name: '_RawNonVegOrder.uid');

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

  final _$vendorIdAtom = Atom(name: '_RawNonVegOrder.vendorId');

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

  final _$addressAtom = Atom(name: '_RawNonVegOrder.address');

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

  final _$totalAmountAtom = Atom(name: '_RawNonVegOrder.totalAmount');

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

  final _$wantsVideoCallAtom = Atom(name: '_RawNonVegOrder.wantsVideoCall');

  @override
  bool get wantsVideoCall {
    _$wantsVideoCallAtom.context.enforceReadPolicy(_$wantsVideoCallAtom);
    _$wantsVideoCallAtom.reportObserved();
    return super.wantsVideoCall;
  }

  @override
  set wantsVideoCall(bool value) {
    _$wantsVideoCallAtom.context.conditionallyRunInAction(() {
      super.wantsVideoCall = value;
      _$wantsVideoCallAtom.reportChanged();
    }, _$wantsVideoCallAtom, name: '${_$wantsVideoCallAtom.name}_set');
  }

  final _$paidAtom = Atom(name: '_RawNonVegOrder.paid');

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

  final _$videoCallCompletedAtom =
      Atom(name: '_RawNonVegOrder.videoCallCompleted');

  @override
  bool get videoCallCompleted {
    _$videoCallCompletedAtom.context
        .enforceReadPolicy(_$videoCallCompletedAtom);
    _$videoCallCompletedAtom.reportObserved();
    return super.videoCallCompleted;
  }

  @override
  set videoCallCompleted(bool value) {
    _$videoCallCompletedAtom.context.conditionallyRunInAction(() {
      super.videoCallCompleted = value;
      _$videoCallCompletedAtom.reportChanged();
    }, _$videoCallCompletedAtom, name: '${_$videoCallCompletedAtom.name}_set');
  }

  final _$videoCallTimeAtom = Atom(name: '_RawNonVegOrder.videoCallTime');

  @override
  String get videoCallTime {
    _$videoCallTimeAtom.context.enforceReadPolicy(_$videoCallTimeAtom);
    _$videoCallTimeAtom.reportObserved();
    return super.videoCallTime;
  }

  @override
  set videoCallTime(String value) {
    _$videoCallTimeAtom.context.conditionallyRunInAction(() {
      super.videoCallTime = value;
      _$videoCallTimeAtom.reportChanged();
    }, _$videoCallTimeAtom, name: '${_$videoCallTimeAtom.name}_set');
  }

  final _$videoCallIdAtom = Atom(name: '_RawNonVegOrder.videoCallId');

  @override
  String get videoCallId {
    _$videoCallIdAtom.context.enforceReadPolicy(_$videoCallIdAtom);
    _$videoCallIdAtom.reportObserved();
    return super.videoCallId;
  }

  @override
  set videoCallId(String value) {
    _$videoCallIdAtom.context.conditionallyRunInAction(() {
      super.videoCallId = value;
      _$videoCallIdAtom.reportChanged();
    }, _$videoCallIdAtom, name: '${_$videoCallIdAtom.name}_set');
  }

  final _$vendorAtom = Atom(name: '_RawNonVegOrder.vendor');

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

  final _$ordersMapAtom = Atom(name: '_RawNonVegOrder.ordersMap');

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
