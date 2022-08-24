import 'package:flutter/material.dart';
import 'package:flutter_swapi/widgets/Home.dart';

void main() => runApp(const Swapi());

class Swapi extends StatelessWidget {
  const Swapi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SWAPI',
      theme: ThemeData(
        fontFamily: 'sw',
        colorScheme: const ColorScheme.dark().copyWith(primary: Colors.black),
      ),
      home: const Home(),
    );
  }
}

