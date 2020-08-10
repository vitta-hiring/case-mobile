import 'package:dio/native_imp.dart';

import 'custom_dio_interceptors.dart';
// import 'custom_dio_interceptors_log.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = "http://www.omdbapi.com";
    interceptors.add(CustomDioInterceptors());
    // interceptors.add(CustomDioInterceptorsLog());
    options.connectTimeout = 5000;
  }
}
