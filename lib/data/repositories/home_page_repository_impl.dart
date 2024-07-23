import 'package:dartz/dartz.dart';
import 'package:sol_pinger_utility/core/errors/failure.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/domain/repositories/home_page_repository.dart';

import '../data_sources/contracts/home_page_data_source.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageDataSource homePageLocalDataSource;

  HomePageRepositoryImpl({required this.homePageLocalDataSource});

  @override
  Future<List<UrlEntity>> getUrlList() async {
    return homePageLocalDataSource.getUrlList();
  }

  @override
  Future<bool> deleteUrlFromUrlList(int id) async {
    return homePageLocalDataSource.deleteUrlFromUrlList(id);
  }

  @override
  Future<Either<Failure, dynamic>> hitUrl(String url) {
    // TODO: implement hitUrl
    throw UnimplementedError();
  }
}