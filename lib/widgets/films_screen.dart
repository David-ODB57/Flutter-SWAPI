import 'package:flutter/material.dart';
import 'package:flutter_swapi/model/film.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  FilmsPageState createState() => FilmsPageState();
}

class FilmsPageState extends State<FilmsPage> {
  late final List<Film> result = [];

  Future getAllFilms() async {

    await http.get(Uri.parse('https://swapi.dev/api/films'))
        .then((response) => json.decode(response.body)['results'])
        .then((films) => {
          films.forEach( (film) {
              result.add(Film(
                  title: film['title'],
                  episode: film['episode_id'],
                  description: film['opening_crawl'],
                  director: film['director'],
                  producer: film['producer'],
                  releaseDate: film['release_date']
              ));
          })
        });
    print('Tableau: $result');
    return result;
  }

  Widget listDeFilm() {
    return FutureBuilder(
      future: getAllFilms(),
      builder: (context, index) {
        /*if (!filmsListSnap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }*/
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (BuildContext ctx, int index) =>
              Column(
                  children: <Widget>[
                    Card(
                      elevation: 10,
                      child: Text(result[index].title)
                    ),
                  ]
              ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          'Films',
          style:  TextStyle(color: Colors.yellow),
        ),

        ),
        body: listDeFilm(),
    );
  }
}