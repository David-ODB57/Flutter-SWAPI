import 'package:flutter/material.dart';
import '../model/weather.dart';
import '../model/weatherList.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  late int temperature = 0;
  late String condition = '';
  late int humidity = 0;
  late String country = '';
  late String city = '';
  late String planet = '';

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    var weatherData = await weatherModel.getLocationWeather();

    setState(() {
      condition = weatherData['weather'][0]['main'];
      humidity = weatherData['main']['humidity'];
      country = weatherData['sys']['country'];
      city = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      planet = weathers[];
    });
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
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/weather/$.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Temperature: $temperature°',
                  style: const TextStyle(
                    fontFamily: 'sw',
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  'condition: $condition',
                  style: const TextStyle(
                    fontFamily: 'sw',
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  'humidity: $humidity%',
                  style: const TextStyle(
                    fontFamily: 'sw',
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  'Ville: $city',
                  style: const TextStyle(
                    fontFamily: 'sw',
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}