import 'package:dot_mobile_test/architectures/domain/entities/UserProfile.dart';

abstract class ProfileRepository {
  Future<UserProfile> userProfile();
}
