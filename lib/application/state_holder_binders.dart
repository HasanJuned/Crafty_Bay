import 'package:get/get.dart';

import '../presentation/state_holders/main_bottom_nav_bar_controller.dart';

class GetXBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }

}