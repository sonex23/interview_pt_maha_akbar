import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;
  final String url;

  NetworkClient(this._dio, {required this.url}) {
    _dio.options = BaseOptions(
      baseUrl: url,
      contentType: 'application/json',
    );
  }

  get dio => _dio;
}
