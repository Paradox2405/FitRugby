import 'package:fitrugby/onlineworkout/selected_onlineworkout_controller.dart';
import 'package:get/get.dart';


class SelectedOnlineWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>SelectedOnlineWorkoutController());
  }
}