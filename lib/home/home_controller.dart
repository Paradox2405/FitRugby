import 'dart:math';

import 'package:fitrugby/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  final name = TextEditingController();
  final position = TextEditingController();
  final bmi = TextEditingController();
  final state = TextEditingController();
  final days = TextEditingController();
  double percentage = 0.0;
  double result = 0.0;
  double height = 0.0;
  double weight = 0.0;
  int coun = 0;
  bool loading = true;
  int tabIndex = 0;

  @override
  void onInit() {
    initValues();
    print('>>> HomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> HomeController ready');
    super.onReady();
  }

  void changeNavPage(int index) {
    tabIndex = index;
    index == 0 ? {Get.offAndToNamed(Routes.home)} : null;
    index == 1 ? {Get.offAndToNamed(Routes.workouttype)} : null;
    index == 2 ? {Get.offAndToNamed(Routes.reports)} : null;
    index == 3 ? {Get.offAndToNamed(Routes.profile)} : null;
    initValues();
    update();
  }

  initValues() async {
    prefs =await _prefs;
    try{
      name.text = prefs.getString('fname').toString();
      days.text = prefs.getInt('counter').toString();
      coun = prefs.getInt('counter')!;
      position.text = prefs.getString('position').toString();
      weight = prefs.getDouble('weight')!;
      height = prefs.getDouble('height')!;
      bmiCalc();
    }catch(e){
      Get.snackbar("Error", "Data not updated\nretry!",backgroundColor: Colors.white);
    }
    loading = false;
    update();
  }

  bmiCalc() async {
    result = (weight / pow(height / 100, 2));
    if (result >= 25) {
      state.text = "Overweight";
    } else if (result > 18.5) {
      state.text = "Normal";
    } else {
      state.text = "Underweight";
    }
    bmi.text = result.toStringAsFixed(2);
    percentageCalc();
  }

  percentageCalc() async {
    percentage = double.parse((coun / 30).toStringAsFixed(1));
  }
}
