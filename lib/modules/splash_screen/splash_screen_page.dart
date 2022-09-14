import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shopping_rider/modules/rider_all_orders/rider_orders_page.dart';
import 'package:shopping_rider/modules/splash_screen/splash_screen_controller.dart';

import '../rider_map_information/rider_map_page.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSplashScreen(
      splash: Text(
        controller.text.toString(),
        style: TextStyle(fontSize: 24),
      ),
      nextScreen: RiderOrdersPage(),
      splashTransition: SplashTransition.sizeTransition,
    );
    // pageTransitionType: PageTransitionType.leftToRight,
  }
}
