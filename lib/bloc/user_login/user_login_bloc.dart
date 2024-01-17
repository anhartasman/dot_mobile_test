import 'package:bloc/bloc.dart';
import 'package:dot_mobile_test/architectures/domain/usecases/UserLoginUseCase.dart';

import './bloc.dart';

class UserLoginBloc extends Bloc<UserLoginBlocEvent, UserLoginBlocState> {
  final UserLoginUseCase userLoginUseCase;
  UserLoginBloc({
    required this.userLoginUseCase,
  }) : super(UserLoginOnIdle()) {
    on<UserLoginBlocEvent>((event, emit) async {
      if (event is UserLoginBlocStart) {
        try {
          emit(UserLoginOnStarted());

          final failureOrTrivia = await userLoginUseCase(event.theAuth);

          final theAccount = await failureOrTrivia.first;
          emit(UserLoginOnSuccess(theAccount: theAccount));
        } catch (e) {
          final theErrorMessage = e.toString();

          emit(UserLoginOnError(
            errorMessage: theErrorMessage,
          ));
        }
      }
    });
  }
}
