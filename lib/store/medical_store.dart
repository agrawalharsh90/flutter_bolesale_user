import 'dart:io';

import 'package:grocery/model/medical.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'medical_store.g.dart';

class MedicalStore = _MedicalStore with _$MedicalStore;

abstract class _MedicalStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @observable
  ObservableMap<String, Medical> medicalPrescriptionData =
      ObservableMap<String, Medical>();

  @observable
  ObservableMap<String, List<Product>> medicinesData =
      ObservableMap<String, List<Product>>();
  @observable
  ObservableMap<String, Product> filtermedicinesData =
      ObservableMap<String, Product>();

  @action
  getmedicinesData() async {
    if (medicinesData.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Product>> response =
            await getProductService.getProductList(collectionName: 'medicine');
        print("reponse in medical store");
        print(response);
        medicinesData.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in medical store");
        print(e);
        throw e;
      }
    }
  }

  @action
  onSearch({String searchString}) async {
    isSearching = true;
    filtermedicinesData = ObservableMap<String, Product>();
    List<Product> dataList = List();
    medicinesData.forEach((key, value) {
      dataList.addAll(value);
    });

    dataList.forEach((element) {
      if (element.name.toLowerCase().contains(searchString.toLowerCase()))
        filtermedicinesData.addAll({element.name: element});
    });
    isSearching = false;
  }

  @action
  clearSearchingStore() {
    isSearching = false;
    filtermedicinesData = ObservableMap<String, Product>();
  }

  @action
  addMedicalData({String uid, File imageFile, String id}) async {
    isLoading = true;
    try {
      String url = await firebaseService.uploadFile(
          folderName: 'prescription', fileName: id, file: imageFile);
      Medical medical = Medical();
      medical.id = id;
      medical.uid = uid;
      medical.prescriptionUrl = url;
      await orderService.postOrders(Medical.toJson(medical), 'medical',
          fileId: id);
      addMedicalDataComplete(medical);
    } catch (e) {
      print("error in medical store");
      print(e);
      isLoading = false;
      throw e;
    }
  }

  @action
  addMedicalDataComplete(Medical medical) {
    medicalPrescriptionData.addAll({medical.id: medical});
    isLoading = false;
  }

  @action
  getMedicalData() async {
    if (medicalPrescriptionData.isEmpty) {
      isLoading = true;
      try {
        Map<String, Medical> response = await medicalService.getMedicalData();
        print("reponse in medical store");
        print(response);
        medicalPrescriptionData.addAll(response);
        isLoading = false;
      } catch (e) {
        print("error in medical store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }

  @action
  clearStore() {
    isLoading = false;
    isSearching = false;
    medicalPrescriptionData = ObservableMap<String, Medical>();
    medicinesData = ObservableMap<String, List<Product>>();
    filtermedicinesData = ObservableMap<String, Product>();
  }
}
