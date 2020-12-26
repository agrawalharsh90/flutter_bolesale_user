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

  final _$isFetchingAtom = Atom(name: '_OrderStore.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.context.enforceReadPolicy(_$isFetchingAtom);
    _$isFetchingAtom.reportObserved();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.context.conditionallyRunInAction(() {
      super.isFetching = value;
      _$isFetchingAtom.reportChanged();
    }, _$isFetchingAtom, name: '${_$isFetchingAtom.name}_set');
  }

  final _$comboAtom = Atom(name: '_OrderStore.combo');

  @override
  Map<String, Order> get combo {
    _$comboAtom.context.enforceReadPolicy(_$comboAtom);
    _$comboAtom.reportObserved();
    return super.combo;
  }

  @override
  set combo(Map<String, Order> value) {
    _$comboAtom.context.conditionallyRunInAction(() {
      super.combo = value;
      _$comboAtom.reportChanged();
    }, _$comboAtom, name: '${_$comboAtom.name}_set');
  }

  final _$postComboRequestAsyncAction = AsyncAction('postComboRequest');

  @override
  Future postComboRequest(Map<String, dynamic> data) {
    return _$postComboRequestAsyncAction
        .run(() => super.postComboRequest(data));
  }

  final _$getComboOrdersAsyncAction = AsyncAction('getComboOrders');

  @override
  Future getComboOrders() {
    return _$getComboOrdersAsyncAction.run(() => super.getComboOrders());
  }

  final _$_OrderStoreActionController = ActionController(name: '_OrderStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_OrderStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_OrderStoreActionController.endAction(_$actionInfo);
    }
  }
}
