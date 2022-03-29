import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrebuiltWorkoutSelectionController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  RxBool loading=true.obs;


  @override
  void onInit(){
    loadDays();
    print('>>> WController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> WController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> WController close');
    super.onClose();
  }

  loadDays() async{
    prefs = await _prefs;
    loading=false.obs;
   loading.refresh();
   Get.forceAppUpdate();
   print(loading.value.toString());
  }
}
