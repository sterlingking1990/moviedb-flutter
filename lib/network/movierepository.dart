import 'package:moviedb_app/model/MovieResponse.dart';

import 'movieapiprovider.dart';

class MovieApiRepository {
  MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<MovieResponse> getMovieList() {
    return _movieApiProvider.getList();
  }

  Future<MovieResponse> getMovieFor(String movieSearch) {
    return _movieApiProvider.getMovieFor(movieSearch);
  }
}
