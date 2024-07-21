import 'package:sol_pinger_utility/domain/entities/url.dart';
import 'package:sol_pinger_utility/domain/repositories/home_page_repository.dart';

import '../data_sources/contracts/local/home_page_local_data_source.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageLocalDataSource homePageLocalDataSource;

  HomePageRepositoryImpl({required this.homePageLocalDataSource});

  @override
  Future<List<UrlEntity>> getUrlList() async {
    return homePageLocalDataSource.getUrlList();
  }

  @override
  Future<bool> deleteUrlFromUrlList(int id) async {
    return homePageLocalDataSource.deleteUrlFromUrlList(id);
  }
}