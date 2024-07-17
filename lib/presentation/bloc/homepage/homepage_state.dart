import 'package:equatable/equatable.dart';
import 'package:sol_pinger_utility/domain/entities/url.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => [];
}

class OnHomePageEmpty extends HomePageState {}

class OnHomePageLoading extends HomePageState {}

class OnHomePageSuccess extends HomePageState {
  final List<UrlEntity> result;

  const OnHomePageSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class OnHomePageError extends HomePageState {
  final String errorMessage;

  const OnHomePageError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
