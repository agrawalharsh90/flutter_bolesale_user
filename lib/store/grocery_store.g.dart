// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroceryStore on _GroceryStore, Store {
  final _$isLoadingAtom = Atom(name: '_GroceryStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_GroceryStore.isSearching');

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

  final _$filterGroceryMapAtom = Atom(name: '_GroceryStore.filterGroceryMap');

  @override
  ObservableMap<String, Product> get filterGroceryMap {
    _$filterGroceryMapAtom.context.enforceReadPolicy(_$filterGroceryMapAtom);
    _$filterGroceryMapAtom.reportObserved();
    return super.filterGroceryMap;
  }

  @override
  set filterGroceryMap(ObservableMap<String, Product> value) {
    _$filterGroceryMapAtom.context.conditionallyRunInAction(() {
      super.filterGroceryMap = value;
      _$filterGroceryMapAtom.reportChanged();
    }, _$filterGroceryMapAtom, name: '${_$filterGroceryMapAtom.name}_set');
  }

  final _$groceryMapAtom = Atom(name: '_GroceryStore.groceryMap');

  @override
  ObservableMap<String, List<Product>> get groceryMap {
    _$groceryMapAtom.context.enforceReadPolicy(_$groceryMapAtom);
    _$groceryMapAtom.reportObserved();
    return super.groceryMap;
  }

  @override
  set groceryMap(ObservableMap<String, List<Product>> value) {
    _$groceryMapAtom.context.conditionallyRunInAction(() {
      super.groceryMap = value;
      _$groceryMapAtom.reportChanged();
    }, _$groceryMapAtom, name: '${_$groceryMapAtom.name}_set');
  }

  final _$groceryListAtom = Atom(name: '_GroceryStore.groceryList');

  @override
  Map<String, dynamic> get groceryList {
    _$groceryListAtom.context.enforceReadPolicy(_$groceryListAtom);
    _$groceryListAtom.reportObserved();
    return super.groceryList;
  }

  @override
  set groceryList(Map<String, dynamic> value) {
    _$groceryListAtom.context.conditionallyRunInAction(() {
      super.groceryList = value;
      _$groceryListAtom.reportChanged();
    }, _$groceryListAtom, name: '${_$groceryListAtom.name}_set');
  }

  final _$getGroceryDataAsyncAction = AsyncAction('getGroceryData');

  @override
  Future getGroceryData() {
    return _$getGroceryDataAsyncAction.run(() => super.getGroceryData());
  }

  final _$addGroceryListAsyncAction = AsyncAction('addGroceryList');

  @override
  Future addGroceryList({File imageFile, String id}) {
    return _$addGroceryListAsyncAction
        .run(() => super.addGroceryList(imageFile: imageFile, id: id));
  }

  final _$getGroceryListAsyncAction = AsyncAction('getGroceryList');

  @override
  Future getGroceryList() {
    return _$getGroceryListAsyncAction.run(() => super.getGroceryList());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_GroceryStoreActionController =
      ActionController(name: '_GroceryStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_GroceryStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_GroceryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_GroceryStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_GroceryStoreActionController.endAction(_$actionInfo);
    }
  }
}
