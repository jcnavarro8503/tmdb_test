class FilmDetailsEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  FilmDetailsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  String toString() {
    return 'FilmDetailsEntity { id: $id, title: $title, overview: $overview }';
  }

  factory FilmDetailsEntity.empty() {
    return FilmDetailsEntity(
      id: 0,
      title: '',
      overview: '',
      posterPath: '',
      backdropPath: '',
      releaseDate: '',
      popularity: 0,
      voteAverage: 0,
      voteCount: 0,
    );
  }

  static FilmDetailsEntity fromJson(Map<String, dynamic> json) {
    return FilmDetailsEntity(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
