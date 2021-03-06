import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;
  Position? position;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      } else {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

        longitude = position!.longitude;
        latitude = position!.latitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
