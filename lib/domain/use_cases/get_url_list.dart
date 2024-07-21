import 'package:sol_pinger_utility/domain/entities/url.dart';
import '../repositories/home_page_repository.dart';

class GetUrlListUseCase {
  final HomePageRepository homePageRepository;

  const GetUrlListUseCase({ required this.homePageRepository });

  Future<List<UrlEntity>> execute() async {
    return await homePageRepository.getUrlList();
  }

  Future<bool> deleteUrlFromUrlList(int id) async {
    return await homePageRepository.deleteUrlFromUrlList(id);
  }
}