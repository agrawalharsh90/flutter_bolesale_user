// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodStore on _FoodStore, Store {
  final _$isLoadingAtom = Atom(name: '_FoodStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_FoodStore.isSearching');

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

  final _$filterFoodRestaurantMapAtom =
      Atom(name: '_FoodStore.filterFoodRestaurantMap');

  @override
  ObservableMap<String, FoodRestaurant> get filterFoodRestaurantMap {
    _$filterFoodRestaurantMapAtom.context
        .enforceReadPolicy(_$filterFoodRestaurantMapAtom);
    _$filterFoodRestaurantMapAtom.reportObserved();
    return super.filterFoodRestaurantMap;
  }

  @override
  set filterFoodRestaurantMap(ObservableMap<String, FoodRestaurant> value) {
    _$filterFoodRestaurantMapAtom.context.conditionallyRunInAction(() {
      super.filterFoodRestaurantMap = value;
      _$filterFoodRestaurantMapAtom.reportChanged();
    }, _$filterFoodRestaurantMapAtom,
        name: '${_$filterFoodRestaurantMapAtom.name}_set');
  }

  final _$foodRestaurantMapAtom = Atom(name: '_FoodStore.foodRestaurantMap');

  @override
  ObservableMap<String, FoodRestaurant> get foodRestaurantMap {
    _$foodRestaurantMapAtom.context.enforceReadPolicy(_$foodRestaurantMapAtom);
    _$foodRestaurantMapAtom.reportObserved();
    return super.foodRestaurantMap;
  }

  @override
  set foodRestaurantMap(ObservableMap<String, FoodRestaurant> value) {
    _$foodRestaurantMapAtom.context.conditionallyRunInAction(() {
      super.foodRestaurantMap = value;
      _$foodRestaurantMapAtom.reportChanged();
    }, _$foodRestaurantMapAtom, name: '${_$foodRestaurantMapAtom.name}_set');
  }

  final _$getFoodRestaurantMapAsyncAction = AsyncAction('getFoodRestaurantMap');

  @override
  Future getFoodRestaurantMap() {
    return _$getFoodRestaurantMapAsyncAction
        .run(() => super.getFoodRestaurantMap());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$_FoodStoreActionController = ActionController(name: '_FoodStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_FoodStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_FoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_FoodStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_FoodStoreActionController.endAction(_$actionInfo);
    }
  }
}
