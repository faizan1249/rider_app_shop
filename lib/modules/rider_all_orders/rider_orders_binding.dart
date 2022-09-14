import 'package:get/get.dart';
import 'package:shopping_rider/modules/rider_all_orders/riders_orders_controller.dart';

class RiderOrdersBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RiderOrdersController());
  }
}
