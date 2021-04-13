import 'package:moviedb_app/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'movierepository.dart';

class NetworkStateManager {
  final MovieApiRepository _repository = MovieApiRepository();
  final BehaviorSubject<MovieResponse> _movieList =
      BehaviorSubject<MovieResponse>();

  getMovieList() async {
    MovieResponse response = await _repository.getMovieList();
    _movieList.sink.add(response);
  }

  getMovieFor(String movieSearched) async {
    MovieResponse response = await _repository.getMovieFor(movieSearched);
    _movieList.sink.add(response);
  }

  dispose() {
    _movieList.close();
  }

  BehaviorSubject<MovieResponse> get movieList => _movieList.stream;
}

final movieState = NetworkStateManager();
