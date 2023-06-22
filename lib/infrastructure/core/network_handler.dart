import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:tmdb_test/tools/index.dart';

class NetworkHandler {
  ///Returns the common headers with authentication values
  Future<Map<String, String>> _commonHeaders() async {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppKeys.tmdbAccessToken}',
    };
  }

  ///Get operations.
  Future<http.Response> get({
    String path = '',
    String params = '',
  }) async {
    final url = AppEndpoints.tmdbApiEndpoint + path + params;
    final uri = Uri.parse(url);
    final headers = await _commonHeaders();

    try {
      debugPrint("-> GET: $url");
      //debugPrint("-> HEADERS: $_headers");
      final res = await http.get(uri, headers: headers).timeout(const Duration(seconds: 15));
      debugPrint("<- RESPONSE CODE: ${res.statusCode}");
      debugPrint("<- RESPONSE BODY: ${res.body}");

      return await handleResponse(response: res);
    } catch (ex) {
      return handleException(exception: ex);
    }
  }

  ///Post operations.
  Future<http.Response> post({
    String path = '',
    String params = '',
    dynamic body = "",
  }) async {
    final url = AppEndpoints.tmdbApiEndpoint + path + params;
    final uri = Uri.parse(url);
    final headers = await _commonHeaders();

    try {
      debugPrint("-> POST: $url");
      //debugPrint("-> HEADERS: $_headers");
      debugPrint("-> BODY: $body");
      final res =
          await http.post(uri, headers: headers, body: body).timeout(const Duration(seconds: 15));
      debugPrint("<- RESPONSE CODE: ${res.statusCode}");
      debugPrint("<- RESPONSE BODY: ${res.body}");

      return handleResponse(response: res);
    } catch (ex) {
      return handleException(exception: ex);
    }
  }

  ///Put operations.
  Future<http.Response> put({
    String path = '',
    String params = '',
    dynamic body,
    Map<String, String> headers = const {},
  }) async {
    final url = AppEndpoints.tmdbApiEndpoint + path + params;
    final uri = Uri.parse(url);
    final headers0 = await _commonHeaders();

    try {
      debugPrint("-> PUT: $url");
      //debugPrint("-> HEADERS: $_headers");
      debugPrint("-> BODY: $body");
      final res =
          await http.put(uri, headers: headers0, body: body).timeout(const Duration(seconds: 15));
      debugPrint("<- RESPONSE CODE: ${res.statusCode}");
      debugPrint("<- RESPONSE BODY: ${res.body}");

      return await handleResponse(response: res);
    } catch (ex) {
      return handleException(exception: ex);
    }
  }

  ///Delete operations.
  Future<http.Response> delete({
    String path = '',
    String params = '',
    Map<String, String> headers = const {},
  }) async {
    final url = AppEndpoints.tmdbApiEndpoint + path + params;
    final uri = Uri.parse(url);
    final headers0 = await _commonHeaders();

    try {
      debugPrint("-> DELETE: $url");
      //debugPrint("-> HEADERS: $_headers");
      final res = await http.delete(uri, headers: headers0).timeout(const Duration(seconds: 15));
      debugPrint("<- RESPONSE CODE: ${res.statusCode}");
      debugPrint("<- RESPONSE BODY: ${res.body}");

      return await handleResponse(response: res);
    } catch (ex) {
      return handleException(exception: ex);
    }
  }

  ///Handle response codes.
  Future<http.Response> handleResponse({
    required http.Response? response,
  }) async {
    switch (response!.statusCode) {
      case 200:
        return response;
      default:
        throw ResponseException(
            response.statusCode, "Ha ocurrido un error, inténtentelo más tarde.");
    }
  }

  ///Handle exception.
  Future<http.Response> handleException({
    required Object exception,
  }) async {
    debugPrint("<- EXEPTION: $exception");

    /// TimeoutException
    if (exception.toString().contains('TimeoutException')) {
      throw ResponseException(408,
          "Tiempo de espera excedido, intente de nuevo más tarde o revise su conexión a Internet");
    }

    throw ResponseException(0, 'Ha ocurrido un error!');
  }
}
