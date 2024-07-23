import 'package:dio/dio.dart';

import '../../../locator.dart';
import '../../constants/app_shared_prefs.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = locator<AppSharedPref>();
    options.headers['token'] = prefs.customerToken;
    super.onRequest(options, handler);
  }

  // If require refreshed token
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = err.response?.data['error_code'];
    super.onError(err, handler);
  }
}
