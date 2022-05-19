import 'package:get/get.dart';

class SelectedOnlineWorkoutController extends GetxController {
  final workoutData=Get.arguments;
  List newWorkoutData=[];


  @override
  void onInit() {
    for(int index=0;index<=10;index++){
      if(workoutData['data']['data$index']!=null){
        newWorkoutData.add(workoutData['data']['data$index']);
      }
    }
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
