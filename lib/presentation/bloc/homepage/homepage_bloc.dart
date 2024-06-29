import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_state.dart';

import '../ui_event.dart';

class HomepageBloc extends Bloc<UiEvent, HomepageState> {
  HomepageBloc() : super(OnHomePageEmpty()) {
    on<OnRefresh>((event, emit) async {
      emit(OnHomePageLoading());
    });
  }
}