import 'package:grocery/model/vendor.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'water_store.g.dart';

class WaterStore = _WaterStore with _$WaterStore;

abstract class _WaterStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, List<Vendor>> waterVendor =
      ObservableMap<String, List<Vendor>>();

  @action
  getWaterVendorList() async {
    if (waterVendor.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Vendor>> response =
            await getWorkerService.getWorkerList(collectionName: 'water');
        print("reponse in water store");
        print(response);
        waterVendor.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in water store");
        print(e);
        throw e;
      }
    }
  }

  @action
  postWaterRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      await orderService.postOrders(data, 'water');
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in postWaterRequest");
      print(e);
      throw e;
    }
  }

  @action
  clearStore() {
    isLoading = false;
    waterVendor = ObservableMap<String, List<Vendor>>();
  }
}
