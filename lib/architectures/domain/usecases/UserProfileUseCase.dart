import 'dart:async';

import 'package:dot_mobile_test/architectures/domain/entities/UserProfile.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/ProfileRepository.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

class UserProfileUseCase extends UseCase<UserProfile, NoParams> {
  UserProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Stream<UserProfile>> call(NoParams params) async {
    final StreamController<UserProfile> controller = StreamController();

    try {
      final the_respon = await repository.userProfile();

      controller.add((the_respon));

      controller.close();
    } catch (e) {
      print("add error ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    }

    return controller.stream;
  }
}
