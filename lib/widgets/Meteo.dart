import 'package:flutter/material.dart';
import '../model/weather.dart';
import '../model/weatherList.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  WeatherState createState() => WeatherState();
}

class WeatherState extends State<Weather> {

  late int temperature = 0;
  late int humidity = 0;
  late String city = '';
  late String condition = '';
  late String image = 'Balosar';
  late String info = '';

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    var weatherData = await weatherModel.getLocationWeather();

   setState(() {
      int time = DateTime.now().hour;

      if(weatherData['weather'][0]['main'] == "Clear" && temperature >=20 && temperature <= 30) {
        image = time > 18 ? 'Coruscant-night' : 'Coruscant-day';
        info = ' comme sur $image';
      } else {
        image = 'Naboo';
        info = ' comme sur $image';
      }

      if(temperature > 40) {
        image = 'Mustafar';
        info = "caniculaire comme sur $image";
      } else {
        for (var w in weathers) {
          if(w == weatherData['weather'][0]['main']) {
            image = '$weathers[$w]';
            info = "comme sur $image";
          }
        }
      }
      condition = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      city = weatherData['name'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
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
    if(info == '') {
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
                    condition,
                    style: const TextStyle(
                        fontFamily: 'sw',
                        fontSize: 60.0,
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
                    info,
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