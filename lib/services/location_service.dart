import 'package:geolocator/geolocator.dart';
import 'package:grocery/model/address.dart';

class LocationService {
  LocationService._();

  factory LocationService.getInstance() => _instance;
  static final LocationService _instance = LocationService._();

  Geolocator geolocator = Geolocator();

  Future<Address> getCurrentLocationAddress() async {
    try {
      Position position = await geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .timeout(Duration(seconds: 10), onTimeout: () {
        return null;
      });
      if (position != null) {
        List<Placemark> p = await geolocator.placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = p[0];
        Address address = Address.fromJson(place.toJson());
        return address;
      }
      return null;
    } catch (e) {
      print("error in get location");
      print(e);
      return null;
    }
  }
}
