import 'package:flutter_swapi/widgets/location.dart';
import 'package:flutter_swapi/widgets/weather_data.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {

    Location location = Location();
    await location.getCurrentLocation();

    WeatherData response = WeatherData(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&units=metric&lang=fr&appid=${location.apiKey}');
    var weatherData = await response.getData();
    return weatherData;
  }

}