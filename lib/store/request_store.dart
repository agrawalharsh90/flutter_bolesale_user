import 'package:grocery/model/request.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'request_store.g.dart';

class RequestStore = _RequestStore with _$RequestStore;

abstract class _RequestStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Map<String, Request> requests = ObservableMap<String, Request>();

  @action
  postRequest(Map<String, dynamic> data) async {
    try {
      isLoading = true;
      Map<String, dynamic> response =
          await requestService.cancelReturnOrder(data);
      Request request = Request.fromJson(response);
      requests.addAll({request.id: request});
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("error in  request store");
      print(e);
      throw e;
    }
  }

  @action
  getRequest() async {
    if (requests.isEmpty) {
      isLoading = true;
      try {
        Map<String, Request> response = await requestService.getAllRequets();
        print("response in request store");
        print(response);
        if (response != null || response.isNotEmpty) requests.addAll(response);
        isLoading = false;
      } catch (e) {
        print("error in request store");
        print(e);
        isLoading = false;
        throw e;
      }
    }
  }

  @action
  clearStore() {
    isLoading = false;
    requests = ObservableMap<String, Request>();
  }
}
