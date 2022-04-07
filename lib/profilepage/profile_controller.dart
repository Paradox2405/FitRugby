import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  final fName = TextEditingController();
  final lName = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final weight = TextEditingController();
  final height= TextEditingController();
  final position = TextEditingController();
  bool enabled = false;
  @override
  void onInit() {
    loadVals();
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
  
  loadVals() async{
    prefs =await _prefs;
    fName.text=prefs.getString('fname').toString();
    lName.text=prefs.getString('lname').toString();
    email.text="getmail";
     pass.text="getpass";
    height.text=prefs.getDouble('height').toString();
    weight.text=prefs.getDouble('weight').toString();
    position.text=prefs.getString('position').toString();
    enabled=true;
    update();
  }
}
