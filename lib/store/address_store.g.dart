// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressStore on _AddressStore, Store {
  final _$isLoadingAtom = Atom(name: '_AddressStore.isLoading');

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

  final _$addressAtom = Atom(name: '_AddressStore.address');

  @override
  Address get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }

  final _$getAddressAsyncAction = AsyncAction('getAddress');

  @override
  Future getAddress() {
    return _$getAddressAsyncAction.run(() => super.getAddress());
  }

  final _$updateAddressAsyncAction = AsyncAction('updateAddress');

  @override
  Future updateAddress(Address data) {
    return _$updateAddressAsyncAction.run(() => super.updateAddress(data));
  }

  final _$_AddressStoreActionController =
      ActionController(name: '_AddressStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_AddressStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_AddressStoreActionController.endAction(_$actionInfo);
    }
  }
}
