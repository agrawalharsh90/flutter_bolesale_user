// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$isLoadingAtom = Atom(name: '_CartStore.isLoading');

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

  final _$cartMapAtom = Atom(name: '_CartStore.cartMap');

  @override
  ObservableMap<String, Map<String, Product>> get cartMap {
    _$cartMapAtom.context.enforceReadPolicy(_$cartMapAtom);
    _$cartMapAtom.reportObserved();
    return super.cartMap;
  }

  @override
  set cartMap(ObservableMap<String, Map<String, Product>> value) {
    _$cartMapAtom.context.conditionallyRunInAction(() {
      super.cartMap = value;
      _$cartMapAtom.reportChanged();
    }, _$cartMapAtom, name: '${_$cartMapAtom.name}_set');
  }

  final _$totalItemsAtom = Atom(name: '_CartStore.totalItems');

  @override
  int get totalItems {
    _$totalItemsAtom.context.enforceReadPolicy(_$totalItemsAtom);
    _$totalItemsAtom.reportObserved();
    return super.totalItems;
  }

  @override
  set totalItems(int value) {
    _$totalItemsAtom.context.conditionallyRunInAction(() {
      super.totalItems = value;
      _$totalItemsAtom.reportChanged();
    }, _$totalItemsAtom, name: '${_$totalItemsAtom.name}_set');
  }

  final _$totalAmountAtom = Atom(name: '_CartStore.totalAmount');

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

  final _$updateCartMapAsyncAction = AsyncAction('updateCartMap');

  @override
  Future updateCartMap(Map<String, Map<String, Product>> dataMap) {
    return _$updateCartMapAsyncAction.run(() => super.updateCartMap(dataMap));
  }

  final _$deleteProductCartAsyncAction = AsyncAction('deleteProductCart');

  @override
  Future deleteProductCart(String type, String key) {
    return _$deleteProductCartAsyncAction
        .run(() => super.deleteProductCart(type, key));
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_CartStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }
}
