import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/Routes.dart';

class ProfileController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _auth = FirebaseAuth.instance;
  late SharedPreferences prefs;
  final btn=TextEditingController();
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
    btn.text="EDIT";
    prefs =await _prefs;
    fName.text=prefs.getString('fname').toString();
    lName.text=prefs.getString('lname').toString();
    email.text="${_auth.currentUser?.email}";
    pass.text="password";
    height.text=prefs.getDouble('height').toString();
    weight.text=prefs.getDouble('weight').toString();
    position.text=prefs.getString('position').toString();
    update();
  }
  onEdit(){
    enabled=true;
    btn.text="SAVE";
    update();
  }
  onSave() async{
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Updating...",
        content: const CircularProgressIndicator());
    prefs =await _prefs;
    try{
      prefs.setString('fname', fName.text).toString();
      prefs.setString('lname', lName.text).toString();
      _auth.currentUser?.updateEmail(email.text);
      _auth.currentUser?.updatePassword(pass.text);
      prefs.setDouble('height', double.parse(height.text)).toString();
      prefs.setDouble('weight', double.parse(weight.text)).toString();
      prefs.setString('position', position.text).toString();
      btn.text = "EDIT";
      update();
      Get.back();
    }catch (e){
      Get.back();
      Get.snackbar("Error", "Details were not updated!\nTry again");
    }

  }
  logout() async{

    Get.defaultDialog(
        barrierDismissible: false,
        title: "Logging out...",
        content: const CircularProgressIndicator());
    try{
      await prefs.clear();
      print("!!!!!!!!!!!1");
      await FirebaseAuth.instance.signOut();
      Get.back();
      Get.offAndToNamed(Routes.welcome);
      update();
    }catch(e){
      Get.back();
      Get.snackbar("Error", "Couldn't logout",backgroundColor: Colors.white);
    }
  }
}
