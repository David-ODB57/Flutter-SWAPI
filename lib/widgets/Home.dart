import 'package:flutter/material.dart';

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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Films', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),

                    ),
                  ),
                  child: const Text('Personnages', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Planètes', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Espèces', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Vaisseaux', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    side: const BorderSide(width: 2.0, color: Colors.yellow,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Véhicules', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}