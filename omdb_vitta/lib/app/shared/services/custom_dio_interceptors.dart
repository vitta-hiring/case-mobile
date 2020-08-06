import 'package:dio/dio.dart';

class CustomDioInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onError(DioError e) async {
    return e;
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }
}
