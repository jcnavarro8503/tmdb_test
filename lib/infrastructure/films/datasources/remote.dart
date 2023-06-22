import 'dart:convert';
import 'package:tmdb_test/domain/index.dart';
import 'package:tmdb_test/infrastructure/index.dart';
import 'package:tmdb_test/tools/index.dart';

class FilmsRemoteDataSource {
  final NetworkHandler networkHandler;

  FilmsRemoteDataSource(this.networkHandler);

  Future<List<FilmEntity>> getFilmsData() async {
    try {
      final response = await networkHandler.get(path: 'popular');
      Map data = json.decode(response.body);

      if (response.statusCode == 200) {
        List<FilmEntity> films =
            (data['results'] as List).map((item) => FilmEntity.fromJson(item)).toList();
        return films;
      }
      throw ResponseException(0, 'Error');
    } catch (ex) {
      rethrow;
    }
  }

  Future<FilmDetailsEntity> getFilmDetailsData(int id) async {
    try {
      final response = await networkHandler.get(params: '$id');

      if (response.statusCode == 200) {
        return FilmDetailsEntity.fromJson(json.decode(response.body));
      }
      throw ResponseException(0, 'Error');
    } catch (ex) {
      rethrow;
    }
  }
}
