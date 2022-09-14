import 'package:get/get.dart';
import 'package:shopping_rider/modules/rider_all_orders/rider_orders_binding.dart';
import 'package:shopping_rider/modules/rider_all_orders/rider_orders_page.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_binding.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_page.dart';

import '../../modules/splash_screen/splash_screen_binding.dart';
import '../../modules/splash_screen/splash_screen_page.dart';

abstract class routes {
  static const initialRoute = '/';
  static const ordersPage = '/ordersPage';
  static const riderMap = '/rider_map';
}

class AppPages {
  static final pages = [
    GetPage(
      name: routes.initialRoute,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: routes.ordersPage,
      page: () => RiderOrdersPage(),
      binding: RiderOrdersBinding(),
    ),
    GetPage(
      name: routes.riderMap,
      page: () => RiderPage(),
      binding: RiderMapBinding(),
    ),
  ];
}
