import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  String apiKey = '180aa9da1467549c9761e5a9a2daad88';
  late int status;

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    try {
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.deniedForever) {
            return Future.error('Localisation indisponible');
          }
        } else {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          latitude = position.latitude;
          longitude = position.longitude;
        }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}