import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters});
}
