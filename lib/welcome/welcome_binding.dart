import 'package:fitrugby/welcome/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomePageController>(()=>WelcomePageController());
  }
}