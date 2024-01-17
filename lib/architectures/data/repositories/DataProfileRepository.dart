import 'package:dot_mobile_test/architectures/data/datasources/remote/profile_remote_data_source.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserProfile.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/ProfileRepository.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataProfileRepository implements ProfileRepository {
  Future<UserProfile> userProfile() async {
    final userProfile = await ProfileRemoteDataSource.userProfile();
    return userProfile;
  }
}
