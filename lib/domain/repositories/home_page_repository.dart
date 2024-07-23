import 'package:dartz/dartz.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';

import '../../core/errors/failure.dart';

abstract class HomePageRepository {
  Future<List<UrlEntity>> getUrlList();
  Future<bool> deleteUrlFromUrlList(int id);
  Future<Either<Failure, dynamic>> hitUrl(String url);
}