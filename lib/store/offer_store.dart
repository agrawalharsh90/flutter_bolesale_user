import 'package:grocery/model/offer.dart';
import 'package:grocery/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'offer_store.g.dart';

class OfferStore = _OfferStore with _$OfferStore;

abstract class _OfferStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableMap<String, Offer> offerMap = ObservableMap<String, Offer>();

  @action
  getOffers() async {
    if (offerMap.isEmpty) {
      isLoading = true;
      try {
        Map<String, Offer> response = await offerService.getOffers();
        print("reponse in offer store");
        print(response);
        offerMap.addAll(response);
        isLoading = false;
      } catch (e) {
        isLoading = false;
        print("error in offer store");
        print(e);
        throw e;
      }
    }
  }

  @action
  clearStore() {
    isLoading = false;
    offerMap = ObservableMap<String, Offer>();
  }
}
