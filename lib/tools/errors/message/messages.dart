import 'package:tmdb_test/tools/index.dart';

abstract class IMessage {
  MessageType get type;
  String get title;
  String get body;
}

class ErrorMessage implements IMessage {
  ErrorMessage(this._body, this._title);
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.error;

  @override
  String get body => _body;
}

class WarningMessage implements IMessage {
  WarningMessage(this._body, this._title);
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.warning;

  @override
  String get body => _body;
}

class SuccessMessage implements IMessage {
  SuccessMessage(this._body, this._title);
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.success;

  @override
  String get body => _body;
}

class NoneMessage implements IMessage {
  @override
  String get title => '';

  @override
  MessageType get type => MessageType.none;

  @override
  String get body => '';
}
