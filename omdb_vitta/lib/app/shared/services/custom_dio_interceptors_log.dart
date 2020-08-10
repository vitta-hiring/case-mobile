import 'package:dio/dio.dart';

class CustomDioInterceptorsLog extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST: [${options.method}] -> PATH: ${options.path} Custom");
    print("${options.headers}");

    return options;
  }

  @override
  Future onError(DioError e) async {
    print("RESPONSE: [${e.response?.statusCode}] -> PATH: ${e.request.path} Custom");
    print(e.message);

    return e;
  }

  @override
  Future onResponse(Response response) async {
    print("RESPONSE: [${response.statusCode}] -> PATH: ${response.request.path} Custom");

    return response;
  }
}
