import 'package:dio/dio.dart';

BaseOptions userOptions = BaseOptions(
  baseUrl: 'http://google.com.br',
  responseType: ResponseType.json,
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000),
);
