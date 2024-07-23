import 'package:equatable/equatable.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object?> get props => [];
}

class OnRefresh extends UiEvent {
  final bool isRefreshed;
  final List<dynamic>? params;

  const OnRefresh({required this.isRefreshed, this.params});

  @override
  List<Object?> get props => [isRefreshed];
}

class OnSubmit extends UiEvent {
  final String input;

  const OnSubmit(this.input);

  @override
  List<Object?> get props => [input];
}
