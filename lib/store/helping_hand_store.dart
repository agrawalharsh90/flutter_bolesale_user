import 'package:grocery/model/vendor.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'helping_hand_store.g.dart';

class HelpingHandStore = _HelpingHandStore with _$HelpingHandStore;

abstract class _HelpingHandStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, List<Vendor>> helpingHandMap =
      ObservableMap<String, List<Vendor>>();

  @action
  getHelpingHandsList() async {
    if (helpingHandMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, List<Vendor>> response = await getWorkerService
            .getWorkerList(collectionName: 'helping_hands');
        print("reponse in helping hand store");
        print(response);
        helpingHandMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in helping hand store");
        print(e);
        throw e;
      }
    }
  }

  @action
  clearStore() {
    isLoading = false;
    helpingHandMap = ObservableMap<String, List<Vendor>>();
  }
}
