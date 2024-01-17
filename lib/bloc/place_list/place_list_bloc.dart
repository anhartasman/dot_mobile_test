import 'package:bloc/bloc.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/PlaceListUseCase.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

import './bloc.dart';

class PlaceListBloc extends Bloc<PlaceListBlocEvent, PlaceListBlocState> {
  final PlaceListUseCase placeListUseCase;
  PlaceListBloc({
    required this.placeListUseCase,
  }) : super(PlaceListBlocState()) {
    on<PlaceListBlocEvent>((event, emit) async {
      if (event is PlaceListBlocRetrieve) {
        try {
          emit(state.copyWith(onLoading: true));

          final failureOrTrivia = await placeListUseCase(NoParams());

          final placeList = await failureOrTrivia.first;
          emit(state.copyWith(
            onLoading: false,
            placeList: placeList,
          ));
        } catch (e) {
          final theErrorMessage = e.toString();

          emit(state.copyWith(
            onLoading: false,
            onError: true,
            errorMessage: theErrorMessage,
          ));
        }
      }
    });
  }
}
