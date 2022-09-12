import 'package:flutter/material.dart';
import '../model/weather.dart';
import '../model/weather_list.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  WeatherState createState() => WeatherState();
}

class WeatherState extends State<Weather> {

  int temperature = 0;
  int humidity = 0;
  String? city;
  String? condition;
  String? image;
  String? info;

  bool isWeatherUp = false;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    dynamic weatherData = await weatherModel.getLocationWeather();

    setState(() {
      int time = DateTime.now().hour;
      final temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      city = weatherData['name'];

      if(temperature > 40) {
        image = 'Mustafar';
        info = "caniculaire comme sur $image";
      }

      if(weatherData['weather'][0]['main'] == "Clear" && temperature >=20 && temperature <= 30) {
        image = time > 18 ? 'Coruscant-night' : 'Coruscant-day';
        info = 'comme sur Coruscant';
      } else {
        for (var w in weathers) {
          if(w['weather'] == weatherData['weather'][0]['main']) {
            image = w['image'];
            info = 'comme sur $image';
          }
        }
      }
      isWeatherUp = true;
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
      body: _weatherDisplay()
    );
  }

  Widget _weatherDisplay() {
    if(!isWeatherUp) {
      return const Center(child: CircularProgressIndicator(
        color: Colors.yellow,
        backgroundColor: Colors.transparent,
      ));
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/weather/$image.jpg'),
            fit: BoxFit.cover,
          )
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$temperature°C',
                      style: const TextStyle(
                          fontFamily: 'sw',
                          fontSize: 75.0,
                          color: Colors.black,
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.yellow,
                                offset: Offset(0, 0),
                                blurRadius: 15
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    '$condition',
                    style: const TextStyle(
                        fontFamily: 'sw',
                        fontSize: 45.0,
                        color: Colors.black,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.yellow,
                              offset: Offset(0, 0),
                              blurRadius: 15
                          ),
                        ]
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '$info',
                    style: const TextStyle(
                        fontFamily: 'sw',
                        fontSize: 30.0,
                        color: Colors.black,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.yellow,
                              offset: Offset(0, 0),
                              blurRadius: 15
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'humidity: $humidity%',
                      style: const TextStyle(
                          fontFamily: 'sw',
                          fontSize: 30.0,
                          color: Colors.black,
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.yellow,
                                offset: Offset(0, 0),
                                blurRadius: 15
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Ville: $city',
                    style: const TextStyle(
                        fontFamily: 'sw',
                        fontSize: 30.0,
                        color: Colors.black,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.yellow,
                              offset: Offset(0, 0),
                              blurRadius: 15
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                    onPressed: () {
                      getLocationData();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.5),
                      side: const BorderSide(
                          color: Colors.yellow,
                          width: 0.5,
                      ),
                      shadowColor: Colors.yellow,
                      elevation: 5,
                    ),
                    child: const Text(
                      'Refresh',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}