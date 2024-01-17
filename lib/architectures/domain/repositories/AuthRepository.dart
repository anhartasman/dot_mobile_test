import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAuth.dart';

abstract class AuthRepository {
  Future<UserAccount> authenticate(UserAuth userAuth);
}
