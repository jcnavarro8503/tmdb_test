import 'package:dartz/dartz.dart';
import 'package:tmdb_test/domain/index.dart';
import 'package:tmdb_test/infrastructure/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmsRepository with ErrorHandling<Failure> {
  final FilmsRemoteDataSource remote;

  FilmsRepository(this.remote);

  Future<Either<Failure, List<FilmEntity>>> getFilms() async {
    return process<List<FilmEntity>>(action: () async {
      try {
        return await remote.getFilmsData();
      } catch (ex) {
        rethrow;
      }
    }, onFail: (_) {
      ResponseException error = _ is ResponseException ? _ : ResponseException(0, _.toString());
      return FailWithMessage(error.code, ErrorMessage(error.message, ''));
    });
  }

  Future<Either<Failure, FilmEntity>> getFilmDetails(int id) async {
    return process<FilmEntity>(action: () async {
      try {
        return await remote.getFilmDetailsData(id);
      } catch (ex) {
        rethrow;
      }
    }, onFail: (_) {
      ResponseException error = _ is ResponseException ? _ : ResponseException(0, _.toString());
      return FailWithMessage(error.code, ErrorMessage(error.message, ''));
    });
  }
}
