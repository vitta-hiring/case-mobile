import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/utils/seriazable_response.dart';

typedef S ItemCreator<S>();

class HttpClient {
  String _baseUrl;

  HttpClient({String baseUrl}) {
    this.baseUrl = baseUrl;
  }

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  set baseUrl(String baseUrl) {
    this._baseUrl = baseUrl;
  }

  void addHeader(Map<String, String> header) {
    this._headers.addAll(header);
  }

  String _buildQueryParams(Map<String, dynamic> params) {
    String paramString = '';
    if (params != null && params.length > 0) {
      paramString = '?';
      params.forEach((key, value) {
        if (value != null) {
          var strValue = value.toString();
          paramString += '$key=$strValue&';
        }
      });
      paramString = paramString.substring(0, paramString.length - 1);
    }
    return paramString;
  }

  Future<TResponse> get<TResponse extends ISeriazableResponse<TResponse>>({
    String uri = '/',
    Map<String, dynamic> query,
    Map<String, String> uriParams,
    ItemCreator<TResponse> creator,
  }) async {
    TResponse responseInstance = creator();
    String queryParams = this._buildQueryParams(query);
    try {
      http.Response response = await http.get(
        this._baseUrl + uri + queryParams,
        headers: this._headers,
      );
      responseInstance = responseInstance.fromJson(jsonDecode(response.body));
      return responseInstance;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
