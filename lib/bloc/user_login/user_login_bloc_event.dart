import 'package:dot_mobile_test/architectures/domain/entities/UserAuth.dart';

abstract class UserLoginBlocEvent {}

class UserLoginBlocStart extends UserLoginBlocEvent {
  final UserAuth theAuth;
  UserLoginBlocStart(this.theAuth);
}
