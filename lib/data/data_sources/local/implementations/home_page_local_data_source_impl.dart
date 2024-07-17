import 'package:sol_pinger_utility/core/database/db_helper.dart';
import 'package:sol_pinger_utility/data/data_sources/contracts/local/home_page_local_data_source.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';

class HomePageLocalDataSourceImpl extends HomePageLocalDataSource {
  final DatabaseHelper databaseHelper;

  HomePageLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<UrlEntity>> getUrlList() async {
    return await databaseHelper.getUrlList();
  }
}