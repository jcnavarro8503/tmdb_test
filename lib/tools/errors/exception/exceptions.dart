class ResponseException implements Exception {
  final int code;
  final String message;

  ResponseException(this.code, this.message);

  @override
  String toString() {
    if (message.isEmpty) return "ResponseException";
    return '$code: $message';
  }
}

class LocalException implements Exception {
  final int code;
  final String message;

  LocalException(this.code, this.message);

  @override
  String toString() {
    if (message.isEmpty) return "LocalException";
    return '$code: $message';
  }
}
