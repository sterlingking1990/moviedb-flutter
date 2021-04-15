import 'package:flutter/material.dart';
import 'package:moviedb_app/extension/MovieListExtension.dart';
import 'package:moviedb_app/extension/MovieSearchExtension.dart';
import 'package:moviedb_app/network/appstatemanager.dart';

void main() => runApp(MovieHomePage());

class MovieHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Movie Project",
        theme: ThemeData(
            primaryColor: Colors.amber,
            primarySwatch: Colors.amber,
            textTheme:
                TextTheme(headline1: TextStyle(fontStyle: FontStyle.normal))),
        home: SafeArea(child: MovieAppSinglePage(title: 'Movie App')),
      );
}

class MovieAppSinglePage extends StatefulWidget {
  final String title;
  const MovieAppSinglePage({Key key, this.title}) : super(key: key);

  @override
  MovieAppSinglePageState createState() => MovieAppSinglePageState();
}

class MovieAppSinglePageState extends State<MovieAppSinglePage> {
  TextEditingController searchInputController;

  searchMovie() {
    setState(() {
      movieState.getMovieFor(searchInputController.text);
    });
  }

  searchMov(String text) {
    setState(() {
      movieState.getMovieFor(text);
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    movieState.getMovieList();
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    searchInputController = TextEditingController();
    movieState.getMovieList();
    // movieState.getMovieList();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(children: [
          Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.0, style: BorderStyle.solid)),
              child: searchExtension(context, searchInputController)),
          SizedBox(height: 10.0),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: movieListExtension(context))),
        ]),
      );
}
