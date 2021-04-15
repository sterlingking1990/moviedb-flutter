import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviedb_app/model/MovieDetailBundle.dart';

class MovieDetail extends StatefulWidget {
  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends State<MovieDetail> {
  //when navigating here, we can trigger the method to fetch and keep in observable related movies as the one been navigated to

  @override
  Widget build(BuildContext context) {
    MovieDetailBundle results = ModalRoute.of(context).settings.arguments;

    String titleToShowOnAppBar = results.movieResult.title;

    String firstTitle = titleToShowOnAppBar.split(" ").first;

    print(firstTitle);
    String secondTitle = titleToShowOnAppBar.split(" ").last != null
        ? titleToShowOnAppBar.split(" ").last
        : firstTitle;

    print(secondTitle);

    // rerun the app with this title to get related title

    if (titleToShowOnAppBar.length > 20) {
      titleToShowOnAppBar = titleToShowOnAppBar.substring(0, 20) + "...";
    }
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            elevation: 100,
            stretch: true,
            title: Text(titleToShowOnAppBar),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
              Image.network(
                "https://image.tmdb.org/t/p/w500/" +
                    results.movieResult.backdropPath,
                fit: BoxFit.cover,
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: Text(
                    results.movieResult.title,
                    style: TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                        Color(0xcdc369fd),
                        Color(0xffeebcbb),
                        Color(0xfcfc4499),
                        Color(0x39eebcbc),
                        Color(0x1234ffff)
                      ],
                          stops: [
                        0.0,
                        0.3,
                        0.5,
                        0.7,
                        0.9
                      ]))),
            ], alignment: AlignmentDirectional.bottomCenter))),
        SliverToBoxAdapter(
            child: Card(
          child: Expanded(
              child: Container(
            margin: EdgeInsets.all(10),
            height: 150,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Review",
                style: TextStyle(letterSpacing: 5),
              ),
              Text(results.movieResult.overview)
            ]),
          )),
        )),
        SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(title: Text("am here " + index.toString()));
            }, childCount: 1000)))
      ],
    ));
  }
}
