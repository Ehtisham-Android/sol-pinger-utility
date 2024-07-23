import 'package:dio/dio.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/server_exception.dart';
import '../../../core/network/retrofit_client.dart';
import '../contracts/home_page_data_source.dart';

class HomePageRemoteDataSourceImpl
    extends HomePageDataSource {
  final RetrofitClient retrofitClient;

  HomePageRemoteDataSourceImpl({required this.retrofitClient});

  @override
  Future<dynamic> hitUrl(String url) async {
    try {
      return await retrofitClient.hitUrl(url);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerException();
        case DioExceptionType.receiveTimeout:
          throw ServerException();
        case DioExceptionType.sendTimeout:
          throw ServerException();
      // networkFailure = const NetworkFailure.requestTimeout();
      // break;
        case DioExceptionType.badCertificate:
          throw ServerException();
      //networkFailure = const NetworkFailure.badCertificate();
        case DioExceptionType.badResponse:
          throw ServerException();
        case DioExceptionType.cancel:
          throw ServerException();
        case DioExceptionType.connectionError:
          throw const ConnectionFailure('Server is not reachable');
        case DioExceptionType.unknown:
          throw ServerException();
      }
    }
  }
}
