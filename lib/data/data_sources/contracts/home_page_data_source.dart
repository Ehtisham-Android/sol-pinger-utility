import '../../../domain/entities/url.dart';

abstract class HomePageDataSource {
  Future<List<UrlEntity>> getUrlList(){
    throw UnimplementedError();
  }

  Future<bool> deleteUrlFromUrlList(int id){
    throw UnimplementedError();
  }

  Future<dynamic> hitUrl(String url){
    throw UnimplementedError();
  }
}