import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bussiness_notebook/data/configuration/http_manager/http_manager.dart';
import 'package:bussiness_notebook/domain/core/Constants.dart';
import 'package:bussiness_notebook/domain/exceptions/exceptions.dart';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

const timeout = Duration(seconds: 5);

@Injectable(as: HttpManager)
class AppHttpManager implements HttpManager {

  @override
  Future<dynamic> get({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    print("EN GET");
    try {
      print('Api Get request url $url');
      final response = await http
          .get(_queryBuilder(url, query), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> post({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Post request url $url, with $body');
      final response = await http
          .post(_queryBuilder(url, query),
          body: body != null ? json.encode(body) : null,
          headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> put({
    String url,
    Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Put request url $url, with $body');
      final response = await http
          .put(_queryBuilder(url, query),
          body: json.encode(body), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  @override
  Future<dynamic> delete({
    String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  }) async {
    try {
      print('Api Delete request url $url');
      final response = await http
          .delete(_queryBuilder(url, query), headers: _headerBuilder(headers))
          .timeout(timeout, onTimeout: () => throw TimeoutException());
      return _returnResponse(response);
    } on Exception catch (_) {
      throw NetworkException();
    }
  }

  //Methods Helpers
  Map<String, String> _headerBuilder(Map<String, String> headers) {
    final headers = <String, String>{};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    if (headers != null && headers.isNotEmpty) {
      headers.forEach((key, value) {
        headers[key] = value;
      });
    }
    return headers;
  }

  dynamic _queryBuilder(String path, Map<String, dynamic> query) {
    print(serverUrl + path);
    print(query);
    final buffer = StringBuffer()..write(serverUrl + path);
    if (query != null) {
      if (query.isNotEmpty) {
        buffer.write('?');
      }
      query.forEach((key, value) {
        buffer.write('$key=$value&');
      });
    }
    print(buffer.toString());

    return Uri.https(serverUrl, path, query);
  }

  dynamic _returnResponse(http.Response response) {
    final responseJson = json.decode(response.body.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      print('Api response success with $responseJson');
      return responseJson;
    }
    print('Api response error with ${response.statusCode} + ${response.body}');
    switch (response.statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
      case 403:
        throw UnauthorisedException();
      case 500:
      default:
        throw ServerException();
    }
  }
}