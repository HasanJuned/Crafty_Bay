import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int currentSelectedScreen = 0;

  void changeScreen(int index) {
    currentSelectedScreen = index;
    update();
  }

  void backToHome(){
    changeScreen(0);
  }
}
