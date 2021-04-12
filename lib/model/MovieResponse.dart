import 'package:moviedb_app/model/results.dart';

class MovieResponse {
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;
  String error;

  MovieResponse(this.results, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        results = List<Results>.from(
          json['results'].map((e) => Results.fromJson(e)),
        ),
        totalPages = json['total_pages'],
        totalResults = json['total_results'],
        error = "";

  Map<String, dynamic> toJson() => {
        'page': this.page,
        'results': this.results?.map((e) => e.toJson())?.toList(),
        'total_pages': this.totalPages,
        'total_results': this.totalResults,
        'error': this.error,
      };
  //
  MovieResponse.withError(String errorValue)
      : results = [],
        this.error = errorValue;
}
