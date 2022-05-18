import 'package:get/get.dart';
import 'online_workouts_controller.dart';


class OnlineWorkoutsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>OnlineWorkoutsController());
  }
}