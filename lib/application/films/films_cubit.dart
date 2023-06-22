import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_test/domain/index.dart';
import 'package:tmdb_test/infrastructure/index.dart';

part 'films_state.dart';

class FilmsCubit extends Cubit<FilmsState> {
  late FilmsRepository filmsRepository;

  FilmsCubit() : super(FilmsInitialState()) {
    _init();
  }

  _init() async {
    NetworkHandler handler = NetworkHandler();

    FilmsRemoteDataSource remote = FilmsRemoteDataSource(handler);
    filmsRepository = FilmsRepository(remote);

    getFilms();
  }

  void getFilms() async {
    debugPrint('get films ...');

    final response = await filmsRepository.getFilms();

    response.fold(
      (failure) {
        debugPrint('failure');
        emit(FilmsStandardState(
          films: const <FilmEntity>[],
          selectedFilm: FilmDetailsEntity.empty(),
        ));
      },
      (data) async {
        debugPrint('success');

        emit(FilmsStandardState(
          films: data,
          selectedFilm: FilmDetailsEntity.empty(),
        ));
      },
    );
  }

  void showDetails(int id) async {
    debugPrint('get film details ...');

    final response = await filmsRepository.getFilmDetails(id);

    response.fold(
      (failure) {
        debugPrint('failure');
        emit(FilmsStandardState(
          films: (state as FilmsStandardState).films,
          selectedFilm: FilmDetailsEntity.empty(),
        ));
      },
      (data) async {
        debugPrint('success');

        emit(FilmsStandardState(
          films: (state as FilmsStandardState).films,
          selectedFilm: data,
        ));
      },
    );
  }
}
