import 'package:tmdb_test/tools/index.dart';

class FailWithMessage extends Failure {
  @override
  final int code;
  @override
  final IMessage message;

  const FailWithMessage(this.code, this.message) : super();

  @override
  List<Object> get props => [code, message];
}
