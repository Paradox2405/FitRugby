import 'dart:math';

import 'package:fitrugby/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final name = TextEditingController();
  final position = TextEditingController();
  final bmi = TextEditingController();
  final state = TextEditingController();
  final days = TextEditingController();
  double? percentage=0.0;
  double? result=0.0;
  double height=0.0;
  double weight=0.0;
  int? coun=0;
  bool loading = true;
  var tabIndex = 0;

  @override
  void onInit(){
    WidgetsFlutterBinding.ensureInitialized();

    print('>>> HomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    loadVals();
    loading = false;
    print('>>> HomeController ready');
    super.onReady();
  }

  void changeNavPage(int index) {
    print(Get.currentRoute);
    tabIndex = index;
    Get.back();
    index == 0 ? Get.toNamed(Routes.home) : null;
    index == 1 ? Get.toNamed(Routes.workouttype) : null;
    index == 2 ? Get.toNamed(Routes.profile) : null;
    update();
  }

  loadVals() async{
    await _prefs.then((SharedPreferences prefs) => initValues(prefs),);

    update();
  }
  initValues(prefs){
    name.text = prefs.getString('fname').toString();
    days.text = prefs.getInt('counter').toString();
    coun = prefs.getInt('counter');
    position.text = prefs.getString('position').toString();
    weight = prefs.getDouble('weight');
    height = prefs.getDouble('height');
    bmiCalc();
  }

  bmiCalc() async {
    result = (weight/pow(height/100, 2));
    if (result! >= 25) {
      state.text = "Overweight";
    } else if (result! > 18.5) {
      state.text = "Normal";
    } else {
      state.text = "Underweight";
    }
    bmi.text = result!.toStringAsFixed(2);
    print(result.toString());
    percentageCalc();
  }

  percentageCalc() async {
    percentage = double.parse((coun! / 30).toStringAsFixed(1));
    print(percentage.toString());
  }
}
