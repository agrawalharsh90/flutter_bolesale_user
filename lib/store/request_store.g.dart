// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestStore on _RequestStore, Store {
  final _$isLoadingAtom = Atom(name: '_RequestStore.isLoading');

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

  final _$requestsAtom = Atom(name: '_RequestStore.requests');

  @override
  Map<String, Request> get requests {
    _$requestsAtom.context.enforceReadPolicy(_$requestsAtom);
    _$requestsAtom.reportObserved();
    return super.requests;
  }

  @override
  set requests(Map<String, Request> value) {
    _$requestsAtom.context.conditionallyRunInAction(() {
      super.requests = value;
      _$requestsAtom.reportChanged();
    }, _$requestsAtom, name: '${_$requestsAtom.name}_set');
  }

  final _$postRequestAsyncAction = AsyncAction('postRequest');

  @override
  Future postRequest(Map<String, dynamic> data) {
    return _$postRequestAsyncAction.run(() => super.postRequest(data));
  }

  final _$getRequestAsyncAction = AsyncAction('getRequest');

  @override
  Future getRequest() {
    return _$getRequestAsyncAction.run(() => super.getRequest());
  }

  final _$_RequestStoreActionController =
      ActionController(name: '_RequestStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_RequestStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_RequestStoreActionController.endAction(_$actionInfo);
    }
  }
}
