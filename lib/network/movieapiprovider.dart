import 'package:dio/dio.dart';
import 'package:moviedb_app/model/MovieResponse.dart';

class MovieApiProvider {
  final String _endpoint =
      "https://api.themoviedb.org/3/discover/movie?api_key=a4d0ca22a331f15340097bc2c117cf80&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false";
  final Dio _dio = Dio();

  Future<MovieResponse> getList() async {
    try {
      Response response = await _dio.get(_endpoint);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace:$stacktrace");
      return MovieResponse.withError(_handleError(error));
    }
  }

  Future<MovieResponse> getMovieFor(String movieSearched) async {
    try {
      final String _endpointMovieSearch =
          'https://api.themoviedb.org/3/search/movie?api_key=a4d0ca22a331f15340097bc2c117cf80&query=$movieSearched';
      Response response = await _dio.get(_endpointMovieSearch);
      print(response.data["results"][0]);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured : $error stackTrace:$stacktrace");
      return MovieResponse.withError(_handleError(error));
    }
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API Server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API Server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API Server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API Server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API Server";
          break;
      }
    } else {
      errorDescription = "Unexception error occured";
    }
    return errorDescription;
  }
}
