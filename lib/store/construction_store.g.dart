// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConstructionStore on _ConstructionStore, Store {
  final _$isLoadingAtom = Atom(name: '_ConstructionStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_ConstructionStore.isSearching');

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

  final _$constructionMapAtom =
      Atom(name: '_ConstructionStore.constructionMap');

  @override
  ObservableMap<String, List<Product>> get constructionMap {
    _$constructionMapAtom.context.enforceReadPolicy(_$constructionMapAtom);
    _$constructionMapAtom.reportObserved();
    return super.constructionMap;
  }

  @override
  set constructionMap(ObservableMap<String, List<Product>> value) {
    _$constructionMapAtom.context.conditionallyRunInAction(() {
      super.constructionMap = value;
      _$constructionMapAtom.reportChanged();
    }, _$constructionMapAtom, name: '${_$constructionMapAtom.name}_set');
  }

  final _$filterConstructionMapAtom =
      Atom(name: '_ConstructionStore.filterConstructionMap');

  @override
  ObservableMap<String, Product> get filterConstructionMap {
    _$filterConstructionMapAtom.context
        .enforceReadPolicy(_$filterConstructionMapAtom);
    _$filterConstructionMapAtom.reportObserved();
    return super.filterConstructionMap;
  }

  @override
  set filterConstructionMap(ObservableMap<String, Product> value) {
    _$filterConstructionMapAtom.context.conditionallyRunInAction(() {
      super.filterConstructionMap = value;
      _$filterConstructionMapAtom.reportChanged();
    }, _$filterConstructionMapAtom,
        name: '${_$filterConstructionMapAtom.name}_set');
  }

  final _$getConstructionListAsyncAction = AsyncAction('getConstructionList');

  @override
  Future getConstructionList() {
    return _$getConstructionListAsyncAction
        .run(() => super.getConstructionList());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_ConstructionStoreActionController =
      ActionController(name: '_ConstructionStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_ConstructionStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_ConstructionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_ConstructionStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_ConstructionStoreActionController.endAction(_$actionInfo);
    }
  }
}
