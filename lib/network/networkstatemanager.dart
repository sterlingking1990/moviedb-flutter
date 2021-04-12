import 'package:moviedb_app/model/MovieResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'movierepository.dart';

class NetworkStateManager {
  final MovieApiRepository _repository = MovieApiRepository();
  final PublishSubject<MovieResponse> _subject =
      PublishSubject<MovieResponse>();

  getMovieList() async {
    MovieResponse response = await _repository.getMovieList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  Observable<MovieResponse> get subject => _subject.stream;
}

final movieState = NetworkStateManager();
