import 'package:dot_mobile_test/routes/app_pages.dart';
import 'package:dot_mobile_test/screens/splash_screen.dart';
import 'package:dot_mobile_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dot_mobile_test/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await di.init();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor:
    //       LightColors.kLightYellow, // navigation bar color
    //   statusBarColor: Warna.warnaUtama, // status bar color
    // ));
    await Get.putAsync(() => AuthService().init());

    return runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: appPages,
      home: splash_screen(),
    );
  }
}
