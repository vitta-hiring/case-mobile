import 'package:dio/dio.dart';

class HttpAdapter {
  final _urlApi = "http://www.omdbapi.com?apikey=d12b4be8";
  final Dio _dio;
  HttpAdapter(this._dio);

  Future<dynamic> getApi(String param) async {
    try {
      Response response = await _dio.get(_urlApi + param);
      return response.data;
    } on DioError catch (err) {
      print(err.error);
      return err.response;
    }
  }
}
