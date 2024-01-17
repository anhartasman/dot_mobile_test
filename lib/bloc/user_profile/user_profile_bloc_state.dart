import 'package:dot_mobile_test/architectures/domain/entities/UserProfile.dart';

abstract class UserProfileBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class Equatable {}

class UserProfileBlocStateOnIdle extends UserProfileBlocState {}

class UserProfileBlocStateOnStarted extends UserProfileBlocState {}

class UserProfileBlocStateOnSuccess extends UserProfileBlocState {
  final UserProfile userProfile;
  UserProfileBlocStateOnSuccess(this.userProfile);
}

class UserProfileBlocStateOnError extends UserProfileBlocState {
  final String errorMessage;
  UserProfileBlocStateOnError(this.errorMessage);
}
