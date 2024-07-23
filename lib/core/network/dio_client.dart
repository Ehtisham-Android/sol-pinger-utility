import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../locator.dart';
import '../constants/app_shared_prefs.dart';
import 'interceptors/token_interceptor.dart';

Dio buildDioClient(String baseUrl) {
  final dio = Dio()
    ..options = BaseOptions(
        baseUrl: baseUrl,
        contentType: "application/json; charset=utf-8",
        headers: getHeaders());
  dio.interceptors.addAll([
    TokenInterceptor(),
    PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)
  ]);
  return dio;
}

Map<String, dynamic> getHeaders() {
  final prefs = locator<AppSharedPref>();
  final Map<String, dynamic> headers = {};
  headers['authKey'] = prefs.fcmToken;
  headers['apiAuthType'] = 'sha256';
  headers['authorization'] = '${prefs.bearerToken}';
  //headers['authorization'] = 'Bearer ${prefs.bearerToken}';
  return headers;
}
