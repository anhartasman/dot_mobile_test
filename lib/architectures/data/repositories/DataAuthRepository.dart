import 'package:dot_mobile_test/architectures/data/datasources/local/auth_local_data_source.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAuth.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/AuthRepository.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataAuthRepository implements AuthRepository {
  Future<UserAccount> authenticate(UserAuth userAuth) async {
    final userAccount = await AuthLocalDataSource.authenticate(userAuth);
    return userAccount;
  }
}
