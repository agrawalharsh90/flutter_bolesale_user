// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helping_hand_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HelpingHandStore on _HelpingHandStore, Store {
  final _$isLoadingAtom = Atom(name: '_HelpingHandStore.isLoading');

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

  final _$helpingHandMapAtom = Atom(name: '_HelpingHandStore.helpingHandMap');

  @override
  ObservableMap<String, List<Vendor>> get helpingHandMap {
    _$helpingHandMapAtom.context.enforceReadPolicy(_$helpingHandMapAtom);
    _$helpingHandMapAtom.reportObserved();
    return super.helpingHandMap;
  }

  @override
  set helpingHandMap(ObservableMap<String, List<Vendor>> value) {
    _$helpingHandMapAtom.context.conditionallyRunInAction(() {
      super.helpingHandMap = value;
      _$helpingHandMapAtom.reportChanged();
    }, _$helpingHandMapAtom, name: '${_$helpingHandMapAtom.name}_set');
  }

  final _$getHelpingHandsListAsyncAction = AsyncAction('getHelpingHandsList');

  @override
  Future getHelpingHandsList() {
    return _$getHelpingHandsListAsyncAction
        .run(() => super.getHelpingHandsList());
  }

  final _$_HelpingHandStoreActionController =
      ActionController(name: '_HelpingHandStore');

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_HelpingHandStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_HelpingHandStoreActionController.endAction(_$actionInfo);
    }
  }
}
