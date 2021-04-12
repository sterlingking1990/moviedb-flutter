import 'package:moviedb_app/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'movierepository.dart';

class NetworkStateManager {
  final MovieApiRepository _repository = MovieApiRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovieList() async {
    MovieResponse response = await _repository.getMovieList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject.stream;
}

final movieState = NetworkStateManager();
