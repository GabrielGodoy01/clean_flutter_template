import 'package:dio/dio.dart';

import 'http_request_interface.dart';

class DioHttpRequest implements IHttpRequest {
  final Dio _dio;
  final String _authorizationToken;

  DioHttpRequest({
    required Dio dio,
    String authorizationToken = '',
  })  : _dio = dio,
        _authorizationToken = authorizationToken;

  @override
  Future<Response> get(String url) async {
    _setAuthorizationToken();
    return _dio.get(url);
  }

  @override
  Future<Response> post(String url, dynamic data) async {
    _setAuthorizationToken();
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, dynamic data) async {
    _setAuthorizationToken();
    return _dio.put(url, data: data);
  }

  void _setAuthorizationToken() {
    if (_authorizationToken.isNotEmpty) {
      _dio.options.headers["authorization"] = _authorizationToken;
    }
  }
}
