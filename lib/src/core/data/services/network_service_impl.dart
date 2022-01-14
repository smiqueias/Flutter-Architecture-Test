import 'package:dio/dio.dart';
import 'package:flutter_architecture_test/src/core/domain/services/network_service.dart';

class NetworkServiceImpl implements NetworkService {
  @override
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) {
    return Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3031',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ).get<T>(path, queryParameters: queryParameters);
  }
}
