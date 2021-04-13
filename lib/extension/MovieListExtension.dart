import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_app/model/MovieResponse.dart';
import 'package:moviedb_app/network/networkstatemanager.dart';

import '../view/mainpage.dart';

extension MovieListing on MovieAppSinglePageState {
  refreshMovieList(BuildContext context) {
    movieState.getMovieList();
  }

  Widget movieListExtension(BuildContext context) {
    try {
      return StreamBuilder<MovieResponse>(
          stream: movieState.movieList,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != "") {
                return _buildErrorWidget(snapshot.data.error);
              }
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              //this picks error that emanates and not in control of the backend
              //i.e the network error
              return _buildErrorWidget(snapshot.error.toString());
            } else {
              return _buildLoadingWidget();
            }
          });
    } catch (error) {
      return _buildErrorWidget("Search does not exist");
    }
  }

  Widget buildList(AsyncSnapshot<MovieResponse> snapshots) {
    try {
      return ListView(
        children: [
          for (int i = 0; i < snapshots.data.results.length; i++)
            Card(
                elevation: 100.0,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w500/" +
                              snapshots.data.results[i].backdropPath,
                          fit: BoxFit.cover)),
                  Text(
                    snapshots.data.results[i].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        backgroundColor: Colors.black,
                        decoration: TextDecoration.overline,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationColor: Colors.amber),
                    textAlign: TextAlign.center,
                  )
                ]))
        ],
      );
    } catch (error) {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
        MaterialButton(
            onPressed: refreshMovieList(context),
            color: Colors.amber,
            elevation: 100,
            child: Icon(Icons.refresh, color: Colors.amber, size: 50))
      ],
    ));
  }

  Widget _buildLoadingWidget() => Center(
        child: Column(
          children: [
            Text("Loading data from API..."),
            CircularProgressIndicator()
          ],
        ),
      );
}
