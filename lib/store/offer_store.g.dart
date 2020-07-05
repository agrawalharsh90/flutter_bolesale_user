// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OfferStore on _OfferStore, Store {
  final _$isLoadingAtom = Atom(name: '_OfferStore.isLoading');

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

  final _$offerMapAtom = Atom(name: '_OfferStore.offerMap');

  @override
  ObservableMap<String, Offer> get offerMap {
    _$offerMapAtom.context.enforceReadPolicy(_$offerMapAtom);
    _$offerMapAtom.reportObserved();
    return super.offerMap;
  }

  @override
  set offerMap(ObservableMap<String, Offer> value) {
    _$offerMapAtom.context.conditionallyRunInAction(() {
      super.offerMap = value;
      _$offerMapAtom.reportChanged();
    }, _$offerMapAtom, name: '${_$offerMapAtom.name}_set');
  }

  final _$getOffersAsyncAction = AsyncAction('getOffers');

  @override
  Future getOffers() {
    return _$getOffersAsyncAction.run(() => super.getOffers());
  }

  final _$_OfferStoreActionController = ActionController(name: '_OfferStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_OfferStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_OfferStoreActionController.endAction(_$actionInfo);
    }
  }
}
