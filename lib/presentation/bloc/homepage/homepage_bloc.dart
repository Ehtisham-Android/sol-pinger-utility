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

    on<DeleteUrlFromUrlList>((event, emit) async {
      emit(OnHomePageLoading());

      final deleteResult = await _getUrlListUseCase.deleteUrlFromUrlList(event.id);
      final result = await _getUrlListUseCase.execute();
      if(deleteResult){
        emit(OnHomePageSuccess(result)); 
      } else {
        emit(OnHomePageDeleteUrlError("Something went wrong", result));
      }
    });

    // on<HitUrl>((event, emit) async {
    //   emit(OnHomePageLoading());
    //
    //   final result = await _getUrlListUseCase.hitUrl(event.url);
    //   result.fold((error) => {emit(OnHomePageError(error.message))},
    //           (success) => {emit(OnCatalogSuccess(success))});
    //
    //   if(deleteResult){
    //     emit(OnHomePageSuccess(result));
    //   } else {
    //     emit(OnHomePageDeleteUrlError("Something went wrong", result));
    //   }
    // });
  }
}