class FilmEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  FilmEntity({
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
    return 'FilmEntity { id: $id, title: $title, overview: $overview }';
  }

  static FilmEntity fromJson(Map<String, dynamic> json) {
    return FilmEntity(
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
