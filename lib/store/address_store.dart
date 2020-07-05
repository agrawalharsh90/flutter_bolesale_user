import 'package:grocery/model/address.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'address_store.g.dart';

class AddressStore = _AddressStore with _$AddressStore;

abstract class _AddressStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Address address;

  @action
  getAddress() async {
    try {
      isLoading = true;
      Address response = await locationService.getCurrentLocationAddress();
      print("response in address store");
      if (response != null) print(Address.toJson(response));
      address = response;
      isLoading = false;
    } catch (e) {
      print("error in get address");
      print(e);
      isLoading = false;
    }
  }

  @action
  updateAddress(Address data) async {
    isLoading = true;
    address = data;
    isLoading = false;
  }

  @action
  clearStore() {
    isLoading = false;
    address = null;
  }
}
