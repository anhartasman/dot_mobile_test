import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAuth.dart';
import 'package:dot_mobile_test/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthLocalDataSource {
  static Future<UserAccount> authenticate(UserAuth userAuth) async {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(userAuth.email);
    if (!emailValid) {
      throw ("Email tidak valid");
    }
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$');
    if (!regex.hasMatch(userAuth.password)) {
      throw ("Password tidak valid");
    }

    await Future.delayed(Duration(seconds: 3));
    final authService = Get.find<AuthService>();
    final userAccount = UserAccount(email: userAuth.email);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userAuth", userAccount.toJson());
    authService.setIsLoggedIn(true, newUser: userAccount);
    return userAccount;
    //end of userLogin
  }
}
