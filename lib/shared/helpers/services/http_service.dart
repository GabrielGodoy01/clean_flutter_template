import 'package:dio/dio.dart';
import '../../domain/storage/local_storage_interface.dart';
import 'http_request_interface.dart';

class HttpService {
  final ILocalStorage storage;
  final IHttpRequest httpRequest;

  HttpService({
    required this.storage,
    required this.httpRequest,
  });

  Future<Response?> get(String url) async {
    return await _handleRequest(() => httpRequest.get(url));
  }

  Future<Response?> post(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.post(url, data));
  }

  Future<Response?> put(String url, dynamic data) async {
    return await _handleRequest(() => httpRequest.put(url, data));
  }

  Future<Response?> _handleRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      return _handleError(e, request);
    }
  }

  Future<String> _getTokenFromStorageOrRefresh() async {
    String token = await storage.getRefreshToken();
    if (token.isEmpty) {
      await _refreshToken();
      token = await storage.getRefreshToken();
    }
    return token;
  }

  Future<void> _refreshToken() async {
    storage.saveRefreshToken('validToken');
    // await authController.refreshUserToken();
  }

  Future<Response?> _handleError(
      DioError e, Future<Response> Function() request) async {
    if (e.response == null || e.response!.statusCode == 401) {
      await _getTokenFromStorageOrRefresh();
      return await request();
    }
    return null;
  }
}
