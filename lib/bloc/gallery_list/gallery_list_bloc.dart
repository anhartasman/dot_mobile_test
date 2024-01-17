import 'package:bloc/bloc.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/GalleryListUseCase.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

import './bloc.dart';

class GalleryListBloc extends Bloc<GalleryListBlocEvent, GalleryListBlocState> {
  final GalleryListUseCase galleryListUseCase;
  GalleryListBloc({
    required this.galleryListUseCase,
  }) : super(GalleryListBlocState()) {
    on<GalleryListBlocEvent>((event, emit) async {
      if (event is GalleryListBlocRetrieve) {
        try {
          emit(state.copyWith(onLoading: true));

          final failureOrTrivia = await galleryListUseCase(NoParams());

          final galleryList = await failureOrTrivia.first;
          emit(state.copyWith(
            onLoading: false,
            galleryList: galleryList,
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
