import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pinger_utility/domain/use_cases/get_url_list.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_event.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetUrlListUseCase _getUrlListUseCase;

  HomePageBloc(this._getUrlListUseCase) : super(OnHomePageEmpty()) {
    on<GetUrlsList>((event, emit) async {
      emit(OnHomePageLoading());

      final result = await _getUrlListUseCase.execute();
      emit(OnHomePageSuccess(result));
    });
  }
}