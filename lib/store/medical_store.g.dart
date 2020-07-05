// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicalStore on _MedicalStore, Store {
  final _$isLoadingAtom = Atom(name: '_MedicalStore.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_MedicalStore.isSearching');

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

  final _$medicalPrescriptionDataAtom =
      Atom(name: '_MedicalStore.medicalPrescriptionData');

  @override
  ObservableMap<String, Medical> get medicalPrescriptionData {
    _$medicalPrescriptionDataAtom.context
        .enforceReadPolicy(_$medicalPrescriptionDataAtom);
    _$medicalPrescriptionDataAtom.reportObserved();
    return super.medicalPrescriptionData;
  }

  @override
  set medicalPrescriptionData(ObservableMap<String, Medical> value) {
    _$medicalPrescriptionDataAtom.context.conditionallyRunInAction(() {
      super.medicalPrescriptionData = value;
      _$medicalPrescriptionDataAtom.reportChanged();
    }, _$medicalPrescriptionDataAtom,
        name: '${_$medicalPrescriptionDataAtom.name}_set');
  }

  final _$medicinesDataAtom = Atom(name: '_MedicalStore.medicinesData');

  @override
  ObservableMap<String, List<Product>> get medicinesData {
    _$medicinesDataAtom.context.enforceReadPolicy(_$medicinesDataAtom);
    _$medicinesDataAtom.reportObserved();
    return super.medicinesData;
  }

  @override
  set medicinesData(ObservableMap<String, List<Product>> value) {
    _$medicinesDataAtom.context.conditionallyRunInAction(() {
      super.medicinesData = value;
      _$medicinesDataAtom.reportChanged();
    }, _$medicinesDataAtom, name: '${_$medicinesDataAtom.name}_set');
  }

  final _$filtermedicinesDataAtom =
      Atom(name: '_MedicalStore.filtermedicinesData');

  @override
  ObservableMap<String, Product> get filtermedicinesData {
    _$filtermedicinesDataAtom.context
        .enforceReadPolicy(_$filtermedicinesDataAtom);
    _$filtermedicinesDataAtom.reportObserved();
    return super.filtermedicinesData;
  }

  @override
  set filtermedicinesData(ObservableMap<String, Product> value) {
    _$filtermedicinesDataAtom.context.conditionallyRunInAction(() {
      super.filtermedicinesData = value;
      _$filtermedicinesDataAtom.reportChanged();
    }, _$filtermedicinesDataAtom,
        name: '${_$filtermedicinesDataAtom.name}_set');
  }

  final _$getmedicinesDataAsyncAction = AsyncAction('getmedicinesData');

  @override
  Future getmedicinesData() {
    return _$getmedicinesDataAsyncAction.run(() => super.getmedicinesData());
  }

  final _$onSearchAsyncAction = AsyncAction('onSearch');

  @override
  Future onSearch({String searchString}) {
    return _$onSearchAsyncAction
        .run(() => super.onSearch(searchString: searchString));
  }

  final _$addMedicalDataAsyncAction = AsyncAction('addMedicalData');

  @override
  Future addMedicalData({String uid, File imageFile, String id}) {
    return _$addMedicalDataAsyncAction.run(
        () => super.addMedicalData(uid: uid, imageFile: imageFile, id: id));
  }

  final _$getMedicalDataAsyncAction = AsyncAction('getMedicalData');

  @override
  Future getMedicalData() {
    return _$getMedicalDataAsyncAction.run(() => super.getMedicalData());
  }

  final _$_MedicalStoreActionController =
      ActionController(name: '_MedicalStore');

  @override
  dynamic clearSearchingStore() {
    final _$actionInfo = _$_MedicalStoreActionController.startAction();
    try {
      return super.clearSearchingStore();
    } finally {
      _$_MedicalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMedicalDataComplete(Medical medical) {
    final _$actionInfo = _$_MedicalStoreActionController.startAction();
    try {
      return super.addMedicalDataComplete(medical);
    } finally {
      _$_MedicalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearStore() {
    final _$actionInfo = _$_MedicalStoreActionController.startAction();
    try {
      return super.clearStore();
    } finally {
      _$_MedicalStoreActionController.endAction(_$actionInfo);
    }
  }
}
