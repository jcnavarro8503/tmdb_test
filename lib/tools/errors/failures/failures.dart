import 'package:equatable/equatable.dart';
import 'package:tmdb_test/tools/index.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  int get code;
  IMessage get message;
}
