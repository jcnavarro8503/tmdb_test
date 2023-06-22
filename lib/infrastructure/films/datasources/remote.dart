import 'dart:convert';
import 'package:tmdb_test/domain/index.dart';
import 'package:tmdb_test/infrastructure/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmsRemoteDataSource {
  final NetworkHandler networkHandler;

  FilmsRemoteDataSource(this.networkHandler);

  Future<List<FilmEntity>> getFilmsData() async {
    try {
      final response = await networkHandler.get(
          path: 'get-popular-movies', params: '?api_key=${AppKeys.tmdbKey}');
      Map data = json.decode(response.body);

      if (data['isSuccess']) {
        List<FilmEntity> immovables =
            (data['result'] as List).map((item) => FilmEntity.fromJson(item)).toList();
        return immovables;
      }
      throw ResponseException(0, data['errorMessage']);
    } catch (ex) {
      rethrow;
    }
  }

  Future<FilmEntity> getFilmDetailsData(int id) async {
    try {
      final response = await networkHandler.get(
          path: 'get-movie-details/$id', params: '?api_key=${AppKeys.tmdbKey}');
      Map data = json.decode(response.body);

      if (data['isSuccess']) {
        return FilmEntity.fromJson(data['Data']);
      }
      throw ResponseException(0, data['errorMessage']);
    } catch (ex) {
      rethrow;
    }
  }
}
