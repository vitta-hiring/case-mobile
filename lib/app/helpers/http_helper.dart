import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

class HttpHelper extends Disposable {
  final String _url;
  final int _timeout;
  HttpHelper(this._url, this._timeout);

  Future<Response> get({
    String path: '',
    Map<String, dynamic> queryParameters,
  }) async {
    print("GET Request");
    String url = '${this._url}$path';
    print("$url");
    Response response =
        await this._dio.get("$url", queryParameters: queryParameters);
    print("Response");
    print(response.data);
    return response;
  }

  Future<Response> post({
    String path: '',
    Map<String, dynamic> queryParameters,
    dynamic body,
    Options options,
  }) async {
    print("POST Request");
    String url = '${this._url}$path';
    print("$url");
    if (body != null) print(body.toString());
    Response response = options != null
        ? await this._dio.post(
              "$url",
              data: body,
              queryParameters: queryParameters,
              options: options,
            )
        : await this._dio.post("$url", data: body);
    print("Response");
    print(response.data);
    return response;
  }

  Future<Response> put({
    String path: '',
    Map<String, dynamic> queryParameters,
    dynamic body,
  }) async {
    print("PUT Request");
    String url = '${this._url}$path';
    print("$url");
    print(body.toString());
    Response response = await this
        ._dio
        .put("$url", data: body, queryParameters: queryParameters);
    print("Response");
    print(response.data);
    return response;
  }

  Dio get _dio => Dio(
        BaseOptions(
          connectTimeout: this._timeout,
          baseUrl: this._url,
        ),
      );

  @override
  void dispose() {
    this._dio.close();
  }
}
