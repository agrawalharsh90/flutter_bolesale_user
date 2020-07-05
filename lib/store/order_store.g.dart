// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStore, Store {
  final _$isLoadingAtom = Atom(name: '_OrderStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$helpingHandsAtom = Atom(name: '_OrderStore.helpingHands');

  @override
  Map<String, VendorRequest> get helpingHands {
    _$helpingHandsAtom.context.enforceReadPolicy(_$helpingHandsAtom);
    _$helpingHandsAtom.reportObserved();
    return super.helpingHands;
  }

  @override
  set helpingHands(Map<String, VendorRequest> value) {
    _$helpingHandsAtom.context.conditionallyRunInAction(() {
      super.helpingHands = value;
      _$helpingHandsAtom.reportChanged();
    }, _$helpingHandsAtom, name: '${_$helpingHandsAtom.name}_set');
  }

  final _$waterAtom = Atom(name: '_OrderStore.water');

  @override
  Map<String, VendorRequest> get water {
    _$waterAtom.context.enforceReadPolicy(_$waterAtom);
    _$waterAtom.reportObserved();
    return super.water;
  }

  @override
  set water(Map<String, VendorRequest> value) {
    _$waterAtom.context.conditionallyRunInAction(() {
      super.water = value;
      _$waterAtom.reportChanged();
    }, _$waterAtom, name: '${_$waterAtom.name}_set');
  }

  final _$rawNonVegAtom = Atom(name: '_OrderStore.rawNonVeg');

  @override
  Map<String, RawNonVegOrder> get rawNonVeg {
    _$rawNonVegAtom.context.enforceReadPolicy(_$rawNonVegAtom);
    _$rawNonVegAtom.reportObserved();
    return super.rawNonVeg;
  }

  @override
  set rawNonVeg(Map<String, RawNonVegOrder> value) {
    _$rawNonVegAtom.context.conditionallyRunInAction(() {
      super.rawNonVeg = value;
      _$rawNonVegAtom.reportChanged();
    }, _$rawNonVegAtom, name: '${_$rawNonVegAtom.name}_set');
  }

  final _$comboAtom = Atom(name: '_OrderStore.combo');

  @override
  Map<String, RawNonVegOrder> get combo {
    _$comboAtom.context.enforceReadPolicy(_$comboAtom);
    _$comboAtom.reportObserved();
    return super.combo;
  }

  @override
  set combo(Map<String, RawNonVegOrder> value) {
    _$comboAtom.context.conditionallyRunInAction(() {
      super.combo = value;
      _$comboAtom.reportChanged();
    }, _$comboAtom, name: '${_$comboAtom.name}_set');
  }

  final _$postWaterRequestAsyncAction = AsyncAction('postWaterRequest');

  @override
  Future postWaterRequest(Map<String, dynamic> data) {
    return _$postWaterRequestAsyncAction
        .run(() => super.postWaterRequest(data));
  }

  final _$postHelpingHandRequestAsyncAction =
      AsyncAction('postHelpingHandRequest');

  @override
  Future postHelpingHandRequest(Map<String, dynamic> data) {
    return _$postHelpingHandRequestAsyncAction
        .run(() => super.postHelpingHandRequest(data));
  }

  final _$postRawNonVegRequestAsyncAction = AsyncAction('postRawNonVegRequest');

  @override
  Future postRawNonVegRequest(Map<String, dynamic> data) {
    return _$postRawNonVegRequestAsyncAction
        .run(() => super.postRawNonVegRequest(data));
  }

  final _$postComboRequestAsyncAction = AsyncAction('postComboRequest');

  @override
  Future postComboRequest(Map<String, dynamic> data) {
    return _$postComboRequestAsyncAction
        .run(() => super.postComboRequest(data));
  }

  final _$getHelpingHandsDataAsyncAction = AsyncAction('getHelpingHandsData');

  @override
  Future getHelpingHandsData() {
    return _$getHelpingHandsDataAsyncAction
        .run(() => super.getHelpingHandsData());
  }

  final _$getWaterDataAsyncAction = AsyncAction('getWaterData');

  @override
  Future getWaterData() {
    return _$getWaterDataAsyncAction.run(() => super.getWaterData());
  }

  final _$getRawNonVegAsyncAction = AsyncAction('getRawNonVeg');

  @override
  Future getRawNonVeg() {
    return _$getRawNonVegAsyncAction.run(() => super.getRawNonVeg());
  }

  final _$getComboOrdersAsyncAction = AsyncAction('getComboOrders');

  @override
  Future getComboOrders() {
    return _$getComboOrdersAsyncAction.run(() => super.getComboOrders());
  }
}
