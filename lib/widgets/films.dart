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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Films',
            style:  TextStyle(color: Colors.yellow),
          ),
        ),
        body: _listDeFilm(),
    );
  }

  Widget _listDeFilm() {
    return FutureBuilder(
        future: getAllFilms(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                  backgroundColor: Colors.transparent,
                ),
            );
          }
            return ListView.builder(
            itemCount: result.length,
            itemBuilder: (BuildContext ctx, index) =>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.black,
                              shadowColor: Colors.yellow,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(style: const TextStyle(fontSize: 18.0, color: Colors.yellow), result[index].title),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(style: const TextStyle(fontSize: 15.0), 'episode ${result[index].episode}'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(style: TextStyle(fontSize: 12.0, color: Colors.yellow), 'directeur'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(style: const TextStyle(fontSize: 12.0), result[index].director),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(style: TextStyle(fontSize: 12.0, color: Colors.yellow), 'producteur'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(style: const TextStyle(fontSize: 12.0), result[index].producer),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(style: TextStyle(fontSize: 12.0,color: Colors.yellow), 'date de sortie:'),
                                  ),Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(style: const TextStyle(fontSize: 12.0), result[index].releaseDate),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ]
                  ),
                ),
            );
        });
  }

  Future getAllFilms() async {

   return await http.get(Uri.parse('https://swapi.dev/api/films'))
        .then((response) => json.decode(response.body)['results'])
        .then((films) => {
          films.forEach( (film) {
              result.add( Film(
                  title: film['title'],
                  episode: film['episode_id'],
                  description: film['opening_crawl'],
                  director: film['director'],
                  producer: film['producer'],
                  releaseDate: film['release_date']
              ));
          })
        });
  }
}


