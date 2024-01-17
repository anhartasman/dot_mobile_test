import 'package:get/get.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  bool isLoggedIn = false;
  UserAccount? theUser;
  void setIsLoggedIn(
    bool newValue, {
    UserAccount? newUser,
  }) {
    isLoggedIn = newValue;
    if (newValue) {
      theUser = newUser;
    }
  }

  Future<void> checkIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("userAuth")) {
      final loggedInUser = UserAccount.fromJson(prefs.getString("userAuth")!);
      setIsLoggedIn(true, newUser: loggedInUser);
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userAuth");
    setIsLoggedIn(false);
  }
}
