import 'package:bloc/bloc.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/UserProfileUseCase.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

import './bloc.dart';

class UserProfileBloc extends Bloc<UserProfileBlocEvent, UserProfileBlocState> {
  final UserProfileUseCase userProfileUseCase;
  UserProfileBloc({
    required this.userProfileUseCase,
  }) : super(UserProfileBlocStateOnIdle()) {
    on<UserProfileBlocEvent>((event, emit) async {
      if (event is UserProfileBlocRetrieve) {
        try {
          emit(UserProfileBlocStateOnStarted());

          final failureOrTrivia = await userProfileUseCase(NoParams());

          final userProfile = await failureOrTrivia.first;
          emit(UserProfileBlocStateOnSuccess(userProfile));
        } catch (e) {
          final theErrorMessage = e.toString();

          emit(UserProfileBlocStateOnError(
            theErrorMessage,
          ));
        }
      }
    });
  }
}
