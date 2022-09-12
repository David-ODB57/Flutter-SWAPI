import 'package:geolocator/geolocator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Location {

  late double? latitude;
  late double? longitude;
  late int status;
  late String? apiKey = dotenv.env['API_KEY'];

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