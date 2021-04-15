import 'package:moviedb_app/model/results.dart';

class MovieDetailBundle {
  Results movieResult;
  List<Results> results;

  MovieDetailBundle(this.results, this.movieResult);
}
