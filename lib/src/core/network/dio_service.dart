import 'package:dio/dio.dart';

abstract class DioService {
  Dio getDio();
}

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3031',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
