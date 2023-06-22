part of 'films_cubit.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}

class FilmsInitialState extends FilmsState {}

class FilmsStandardState extends FilmsState {
  final List<FilmEntity> films;
  final FilmDetailsEntity selectedFilm;

  const FilmsStandardState({
    required this.films,
    required this.selectedFilm,
  });

  @override
  List<Object> get props => [films, selectedFilm];
}
