import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Meteo extends StatefulWidget {
  const Meteo({Key? key}) : super(key: key);

  @override
  MeteoState createState() => MeteoState();
}

class MeteoState extends State<Meteo> {

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Services de localisation désactivé.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Localisation permissions refusées');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Localisation refusée de façon permanente, on ne peut demander de permission.');
    }
    // continue accessing the position of the device.
    Position currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(currentLocation);
    //Retourne Latitude: 54.656565, Longitude: 6.32154584
     var pos = await http
        .get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&units=metric&lang=fr&appid=180aa9da1467549c9761e5a9a2daad88'))
        .then((response) => json.decode(response.body));
    print(pos);
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Météo',
            style:  TextStyle(color: Colors.yellow),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             ElevatedButton(
               onPressed: _determinePosition,
               child: Text(
                   style: TextStyle(color: Colors.yellow),
                   "Où suis-je ?"
               ),
             ),
            ],
          ),
        ),
    );
  }
}