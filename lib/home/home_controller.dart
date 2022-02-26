import 'package:fitrugby/routes/Routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0;

  @override
  void onInit() {
    print('>>> HomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> HomeController ready');
    super.onReady();
  }

  void changeTabIndex(int index) {
    print(Get.currentRoute);
    tabIndex = index;
    Get.back();
    index==0?Get.offNamed(Routes.home):null;
    index==1?Get.offNamed(Routes.workouttype):null;
    index==2?Get.offNamed(Routes.profile):null;
    update();
  }
}