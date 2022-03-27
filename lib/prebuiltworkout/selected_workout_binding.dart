import 'package:fitrugby/prebuiltworkout/selected_workout_controller.dart';
import 'package:get/get.dart';


class SelectedWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>SelectedWorkoutController());
  }
}