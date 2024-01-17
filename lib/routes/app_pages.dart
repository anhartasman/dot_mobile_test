import 'package:dot_mobile_test/bloc/user_login/user_login_bloc.dart';
import 'package:dot_mobile_test/middlewares/member_guard.dart';
import 'package:dot_mobile_test/screens/home_page.dart';
import 'package:dot_mobile_test/screens/login_page.dart';
import 'package:dot_mobile_test/screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:dot_mobile_test/injection_container.dart' as di;
import 'package:dot_mobile_test/routes/app_routes.dart';

final appPages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => splash_screen(),
  ),
  GetPage(
    name: Routes.homeMenuRoute,
    page: () {
      return home_page();
    },
    middlewares: [
      MemberGuard(), // Add the middleware here
    ],
  ),
  GetPage(
    name: Routes.authLoginRoute,
    page: () => BlocProvider<UserLoginBloc>(
        create: (BuildContext context) => di.sl<UserLoginBloc>(),
        child: login_page()),
  ),
];
