import 'package:flutter/material.dart';
import 'films.dart';
import 'package:flutter_swapi/widgets/notifications.dart';
import 'meteo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SWAPI',
          style: TextStyle(
            fontSize: 50,
            color: Colors.yellow,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 15.0,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/bg.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: const EdgeInsets.all(10),
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 1.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Films', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FilmsPage()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 1.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Météo', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Weather()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 1.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Notification', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}