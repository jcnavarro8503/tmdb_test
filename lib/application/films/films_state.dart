part of 'films_cubit.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}

class FilmsInitialState extends FilmsState {}

class FilmsStandardState extends FilmsState {
  final List<FilmEntity> fimls;
  final FilmEntity? selectedFilm;

  const FilmsStandardState({
    required this.fimls,
    this.selectedFilm,
  });

  @override
  List<Object> get props => [fimls];
}
