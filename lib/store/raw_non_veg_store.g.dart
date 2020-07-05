// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_non_veg_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RawNonVegStore on _RawNonVegStore, Store {
  final _$isLoadingAtom = Atom(name: '_RawNonVegStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_RawNonVegStore.isSearching');

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

  final _$filterNonVegMapAtom = Atom(name: '_RawNonVegStore.filterNonVegMap');

  @override
  ObservableMap<String, Product> get filterNonVegMap {
    _$filterNonVegMapAtom.context.enforceReadPolicy(_$filterNonVegMapAtom);
    _$filterNonVegMapAtom.reportObserved();
    return super.filterNonVegMap;
  }

  @override
  set filterNonVegMap(ObservableMap<String, Product> value) {
    _$filterNonVegMapAtom.context.conditionallyRunInAction(() {
      super.filterNonVegMap = value;
      _$filterNonVegMapAtom.reportChanged();
    }, _$filterNonVegMapAtom, name: '${_$filterNonVegMapAtom.name}_set');
  }

  final _$nonVegVendorsAtom = Atom(name: '_RawNonVegStore.nonVegVendors');

  @override
  ObservableMap<String, Vendor> get nonVegVendors {
    _$nonVegVendorsAtom.context.enforceReadPolicy(_$nonVegVendorsAtom);
    _$nonVegVendorsAtom.reportObserved();
    return super.nonVegVendors;
  }

  @override
  set nonVegVendors(ObservableMap<String, Vendor> value) {
    _$nonVegVendorsAtom.context.conditionallyRunInAction(() {
      super.nonVegVendors = value;
      _$nonVegVendorsAtom.reportChanged();
    }, _$nonVegVendorsAtom, name: '${_$nonVegVendorsAtom.name}_set');
  }

  final _$nonVegMapAtom = Atom(name: '_RawNonVegStore.nonVegMap');

  @override
  ObservableMap<String, List<Product>> get nonVegMap {
    _$nonVegMapAtom.context.enforceReadPolicy(_$nonVegMapAtom);
    _$nonVegMapAtom.reportObserved();
    return super.nonVegMap;
  }

  @override
  set nonVegMap(ObservableMap<String, List<Product>> value) {
    _$nonVegMapAtom.context.conditionallyRunInAction(() {
      super.nonVegMap = value;
      _$nonVegMapAtom.reportChanged();
    }, _$nonVegMapAtom, name: '${_$nonVegMapAtom.name}_set');
  }

  final _$getRawNonVegListAsyncAction = AsyncAction('getRawNonVegList');

  @override
  Future getRawNonVegList() {
    return _$getRawNonVegListAsyncAction.run(() => super.getRawNonVegList());
  }

  final _$getRawNonVegVendorsAsyncAction = AsyncAction('getRawNonVegVendors');

  @override
  Future getRawNonVegVendors() {
    return _$getRawNonVegVendorsAsyncAction
        .run(() => super.getRawNonVegVendors());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_RawNonVegStoreActionController =
      ActionController(name: '_RawNonVegStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_RawNonVegStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_RawNonVegStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_RawNonVegStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_RawNonVegStoreActionController.endAction(_$actionInfo);
    }
  }
}
