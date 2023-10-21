import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

import '../presentation/state_holders/category_controller.dart';
import '../presentation/state_holders/email_verification_controller.dart';
import '../presentation/state_holders/home_slider_controller.dart';
import '../presentation/state_holders/main_bottom_nav_bar_controller.dart';
import '../presentation/state_holders/product_controller.dart';

class GetXBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OTPVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(ProductController());
  }

}