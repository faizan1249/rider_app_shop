import 'package:get/get.dart';
import 'package:shopping_rider/modules/splash_screen/splash_screen_controller.dart';
class SplashScreenBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashScreenController());
  }
}