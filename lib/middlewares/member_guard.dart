import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dot_mobile_test/routes/app_routes.dart';
import 'package:dot_mobile_test/services/auth_service.dart';

class MemberGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isLoggedIn
        ? null
        : const RouteSettings(name: Routes.authLoginRoute);
  }
}
