import 'package:get/get.dart';
import 'workout_type_controller.dart';

class WorkoutTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>WorkoutTypeController());
  }
}