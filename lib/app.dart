import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_rider/core/constant/string_constants.dart';
import 'package:shopping_rider/core/routings/app_routes.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_binding.dart';
import 'package:shopping_rider/modules/splash_screen/splash_screen_binding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Apptitle,
      getPages: AppPages.pages,
      initialBinding: SplashScreenBinding(),
      initialRoute: routes.initialRoute,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}
