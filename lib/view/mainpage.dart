import 'package:flutter/material.dart';
import 'package:moviedb_app/extension/MovieListExtension.dart';
import 'package:moviedb_app/network/networkstatemanager.dart';

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
  @override
  void initState() {
    super.initState();
    movieState.getMovieList();
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
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        hintText: "Search movie by title",
                        contentPadding: EdgeInsets.all(5.0),
                        focusColor: Colors.black,
                        hoverColor: Colors.black,
                        border: InputBorder.none),
                    cursorColor: Colors.black),
                MaterialButton(
                    onPressed: null, child: Icon(Icons.search), elevation: 100)
              ])),
          SizedBox(height: 10.0),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: movieListExtension(context))),
        ]),
      );
}
