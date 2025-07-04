import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrebuiltWorkoutSelectionController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  bool loading=true;


  @override
  void onInit(){
    loadDays();
    print('>>> WController init');
    super.onInit();
  }

  @override
  void onReady() {
    update();
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
    loading=false;
   update();
  }
}
