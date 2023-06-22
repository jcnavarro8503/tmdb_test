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
    final response = await filmsRepository.getFilms();

    response.fold(
      (failure) {
        debugPrint('failure');
        emit(const FilmsStandardState(
          fimls: <FilmEntity>[],
          selectedFilm: null,
        ));
      },
      (data) async {
        debugPrint('success');

        emit(FilmsStandardState(
          fimls: data,
        ));
      },
    );
  }

  void showDetails(int id) async {
    final response = await filmsRepository.getFilmDetails(id);

    response.fold(
      (failure) {
        debugPrint('failure');
        emit(FilmsStandardState(
          fimls: (state as FilmsStandardState).fimls,
          selectedFilm: null,
        ));
      },
      (data) async {
        debugPrint('success');

        emit(FilmsStandardState(
          fimls: (state as FilmsStandardState).fimls,
          selectedFilm: data,
        ));
      },
    );
  }
}
