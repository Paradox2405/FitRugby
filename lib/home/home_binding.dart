import 'package:get/get.dart';
import 'home_controller.dart';
import 'navigation_bar.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put(HomeController(), permanent: true);
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>NavBar());
  }
}