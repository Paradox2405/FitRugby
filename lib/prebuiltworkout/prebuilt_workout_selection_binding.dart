import 'package:fitrugby/prebuiltworkout/prebuilt_workout_selection_controller.dart';
import 'package:get/get.dart';


class PrebuiltWorkoutSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>PrebuiltWorkoutSelectionController());
  }
}