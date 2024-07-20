import 'package:sol_pinger_utility/domain/entities/url.dart';

abstract class HomePageRepository {
  Future<List<UrlEntity>> getUrlList();
  Future<bool> deleteUrlFromUrlList(int id);
}