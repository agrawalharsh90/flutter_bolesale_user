// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WaterStore on _WaterStore, Store {
  final _$isLoadingAtom = Atom(name: '_WaterStore.isLoading');

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

  final _$waterVendorAtom = Atom(name: '_WaterStore.waterVendor');

  @override
  ObservableMap<String, List<Vendor>> get waterVendor {
    _$waterVendorAtom.context.enforceReadPolicy(_$waterVendorAtom);
    _$waterVendorAtom.reportObserved();
    return super.waterVendor;
  }

  @override
  set waterVendor(ObservableMap<String, List<Vendor>> value) {
    _$waterVendorAtom.context.conditionallyRunInAction(() {
      super.waterVendor = value;
      _$waterVendorAtom.reportChanged();
    }, _$waterVendorAtom, name: '${_$waterVendorAtom.name}_set');
  }

  final _$getWaterVendorListAsyncAction = AsyncAction('getWaterVendorList');

  @override
  Future getWaterVendorList() {
    return _$getWaterVendorListAsyncAction
        .run(() => super.getWaterVendorList());
  }

  final _$postWaterRequestAsyncAction = AsyncAction('postWaterRequest');

  @override
  Future postWaterRequest(Map<String, dynamic> data) {
    return _$postWaterRequestAsyncAction
        .run(() => super.postWaterRequest(data));
  }

  final _$_WaterStoreActionController = ActionController(name: '_WaterStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_WaterStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_WaterStoreActionController.endAction(_$actionInfo);
    }
  }
}
