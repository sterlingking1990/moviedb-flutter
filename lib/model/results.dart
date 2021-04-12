class Results {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  int voteCount;

  Results.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genreIds = List<int>.from(json["genre_ids"]),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteCount = json['vote_count'];

  Map<String, dynamic> toJson() => {
        'adult': this.adult,
        'backdrop_path': this.backdropPath,
        'genre_ids': this.genreIds,
        'id': this.id,
        'original_language': this.originalLanguage,
        'original_title': this.originalTitle,
        'overview': this.overview,
        'popularity': this.popularity,
        'poster_path': this.posterPath,
        'release_date': this.releaseDate,
        'title': this.title,
        'video': this.video,
        'vote_count': this.voteCount,
      };
}
