import 'package:get/get.dart';
import 'package:shopping_rider/modules/rider_map_information/rider_map_controller.dart';

class RiderMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RiderMapController());
  }
}
