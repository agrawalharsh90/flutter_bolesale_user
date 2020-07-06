// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClothesStore on _ClothesStore, Store {
  final _$isLoadingAtom = Atom(name: '_ClothesStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_ClothesStore.isSearching');

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

  final _$productMapAtom = Atom(name: '_ClothesStore.productMap');

  @override
  ObservableMap<String, List<Product>> get productMap {
    _$productMapAtom.context.enforceReadPolicy(_$productMapAtom);
    _$productMapAtom.reportObserved();
    return super.productMap;
  }

  @override
  set productMap(ObservableMap<String, List<Product>> value) {
    _$productMapAtom.context.conditionallyRunInAction(() {
      super.productMap = value;
      _$productMapAtom.reportChanged();
    }, _$productMapAtom, name: '${_$productMapAtom.name}_set');
  }

  final _$filterProductMapAtom = Atom(name: '_ClothesStore.filterProductMap');

  @override
  ObservableMap<String, Product> get filterProductMap {
    _$filterProductMapAtom.context.enforceReadPolicy(_$filterProductMapAtom);
    _$filterProductMapAtom.reportObserved();
    return super.filterProductMap;
  }

  @override
  set filterProductMap(ObservableMap<String, Product> value) {
    _$filterProductMapAtom.context.conditionallyRunInAction(() {
      super.filterProductMap = value;
      _$filterProductMapAtom.reportChanged();
    }, _$filterProductMapAtom, name: '${_$filterProductMapAtom.name}_set');
  }

  final _$fetchProductMapAsyncAction = AsyncAction('fetchProductMap');

  @override
  Future fetchProductMap() {
    return _$fetchProductMapAsyncAction.run(() => super.fetchProductMap());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_ClothesStoreActionController =
      ActionController(name: '_ClothesStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_ClothesStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_ClothesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_ClothesStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_ClothesStoreActionController.endAction(_$actionInfo);
    }
  }
}
