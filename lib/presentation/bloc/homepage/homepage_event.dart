import 'package:equatable/equatable.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object?> get props => [];
}

class GetUrlsList extends HomePageEvent {
  const GetUrlsList();
}

class DeleteUrlFromUrlList extends HomePageEvent {
  final int id;

  const DeleteUrlFromUrlList({required this.id});
}

class HitUrl extends HomePageEvent {
  final String url;

  const HitUrl({required this.url});
}