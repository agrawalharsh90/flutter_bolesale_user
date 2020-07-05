// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegs_fruits_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VegFuitsStore on _VegFuitsStore, Store {
  final _$isLoadingAtom = Atom(name: '_VegFuitsStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_VegFuitsStore.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.context.enforceReadPolicy(_$isSearchingAtom);
    _$isSearchingAtom.reportObserved();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.context.conditionallyRunInAction(() {
      super.isSearching = value;
      _$isSearchingAtom.reportChanged();
    }, _$isSearchingAtom, name: '${_$isSearchingAtom.name}_set');
  }

  final _$filterVegFruitsListAtom =
      Atom(name: '_VegFuitsStore.filterVegFruitsList');

  @override
  ObservableMap<String, Product> get filterVegFruitsList {
    _$filterVegFruitsListAtom.context
        .enforceReadPolicy(_$filterVegFruitsListAtom);
    _$filterVegFruitsListAtom.reportObserved();
    return super.filterVegFruitsList;
  }

  @override
  set filterVegFruitsList(ObservableMap<String, Product> value) {
    _$filterVegFruitsListAtom.context.conditionallyRunInAction(() {
      super.filterVegFruitsList = value;
      _$filterVegFruitsListAtom.reportChanged();
    }, _$filterVegFruitsListAtom,
        name: '${_$filterVegFruitsListAtom.name}_set');
  }

  final _$vegFruitsListAtom = Atom(name: '_VegFuitsStore.vegFruitsList');

  @override
  ObservableMap<String, List<Product>> get vegFruitsList {
    _$vegFruitsListAtom.context.enforceReadPolicy(_$vegFruitsListAtom);
    _$vegFruitsListAtom.reportObserved();
    return super.vegFruitsList;
  }

  @override
  set vegFruitsList(ObservableMap<String, List<Product>> value) {
    _$vegFruitsListAtom.context.conditionallyRunInAction(() {
      super.vegFruitsList = value;
      _$vegFruitsListAtom.reportChanged();
    }, _$vegFruitsListAtom, name: '${_$vegFruitsListAtom.name}_set');
  }

  final _$getVegFruitsListAsyncAction = AsyncAction('getVegFruitsList');

  @override
  Future getVegFruitsList() {
    return _$getVegFruitsListAsyncAction.run(() => super.getVegFruitsList());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_VegFuitsStoreActionController =
      ActionController(name: '_VegFuitsStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_VegFuitsStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_VegFuitsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_VegFuitsStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_VegFuitsStoreActionController.endAction(_$actionInfo);
    }
  }
}
