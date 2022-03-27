import 'package:fitrugby/routes/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();

  login() async {
    if (password.text.length >= 6) {
      Get.defaultDialog(
          title: "Logging in...", content: const CircularProgressIndicator());
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        if (user != null) {
          Get.back();
          Get.offAndToNamed(Routes.home);
        }
      } catch (e) {
        Get.back();
        print(e);
        Get.snackbar("Error", "Registration Error: " + e.toString());
      }
    } else {
      Get.snackbar("Error", "Passwords must be at least 6 characters long",
          duration: const Duration(seconds: 5));

    }
  }


  googleLogin() async {
    Get.defaultDialog(
        title: "Signing In...",
        content: CircularProgressIndicator());
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
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

    //Add user to db logic
    // try {
    //   var dio = diore.Dio();
    //   response = await dio.post('https://cashbook-web-db.herokuapp.com/users',
    //       data: {
    //         'username': user.email,
    //         'name': user.displayName,
    //         'token': user.uid
    //       });
    //   print(response.data.toString());
    // } catch (e) {
    //   print('User Exists! $e');
    // }
    // //get list
    // var apiProvider = ItemsApiProvider();
    // await apiProvider.getAllExpenses();
    Get.back();
    Get.toNamed(Routes.home); // navigate to your wanted page
  }
}
