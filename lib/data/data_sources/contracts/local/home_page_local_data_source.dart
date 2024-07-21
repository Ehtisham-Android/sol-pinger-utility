import '../../../../domain/entities/url.dart';

abstract class HomePageLocalDataSource {
  Future<List<UrlEntity>> getUrlList();
  Future<bool> deleteUrlFromUrlList(int id);
}