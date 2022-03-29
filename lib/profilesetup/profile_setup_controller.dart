import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitrugby/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetupController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _auth = FirebaseAuth.instance;
  final fName = TextEditingController();
  final lName = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  final position = TextEditingController();
  List arg = Get.arguments;

  @override
  void onInit() {
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

  registerUser() async {

    Get.defaultDialog(
        barrierDismissible: false,
        title: "Registering...",
        content: const CircularProgressIndicator());

    if (arg[0] == "G") {

      googleLogin();
      Get.back();

    } else if (arg[0] == "L") {

      addDetails();
      Get.back();
      Get.toNamed(Routes.home);

    } else {
      try {
        print(arg[1].toString());
        await _auth.createUserWithEmailAndPassword(
            email: arg[0], password: arg[1]);
        if (_auth.currentUser!.uid!=null){
          addDetails();
        }else {
          Get.snackbar("Error", "Cant Register");
        }

      } catch (e) {
        Get.snackbar("Error", "Registration Error:" + e.toString());
        Get.back();
      }
    }
  }

  addDetails() async {
    double high = double.parse(height.text);
    double wei = double.parse(weight.text);
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('fname', fName.text);
    await prefs.setString('lname', lName.text);
    await prefs.setDouble('height', high);
    await prefs.setDouble('weight', wei);
    await prefs.setString('position', position.text);
    await prefs.setInt('counter', 0);
    await prefs.setBool('day1', false);
    update();
    Get.back();
    Get.toNamed(Routes.home);
  }

  googleLogin() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);
      if (authResult.user!.uid.isNotEmpty) {
        addDetails();
      } else {
        Get.snackbar("Error", "Not Registered");
      }
    } catch (e) {
      Get.snackbar("Error", "$e", backgroundColor: Colors.white);
      Get.back();
    }
  }
}
