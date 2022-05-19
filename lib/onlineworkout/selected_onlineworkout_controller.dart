import 'package:get/get.dart';

class SelectedOnlineWorkoutController extends GetxController {
  final workoutData=Get.arguments;

  @override
  void onInit() {
    final x=workoutData['data'].removeWhere((x) => x == "");
    print(x);
    print('>>> WController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> WController ready');
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    print('>>> WController close');
    super.onClose();
  }

}
