import 'package:equatable/equatable.dart';
import 'package:sol_pinger_utility/domain/entities/base.dart';


abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object?> get props => [];
}

class OnHomePageEmpty extends HomepageState {}

class OnHomePageLoading extends HomepageState {}

class OnHomePageSuccess extends HomepageState {
  final BaseEntity result;

  const OnHomePageSuccess(this.result);

  @override
  List<Object?> get props => [result];
}

class OnHomePageError extends HomepageState {
  final String errorMessage;

  const OnHomePageError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
