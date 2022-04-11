import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitrugby/routes/Routes.dart';
import 'package:get/get.dart';

class WelcomePageController extends GetxController {


  @override
  void onInit() {
    redirect();
    print('>>> WelcomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> WelcomeController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> WController close');
    super.onClose();
  }
  
  redirect() async{
    if (await FirebaseAuth.instance.currentUser?.uid != null) {
     Get.toNamed(Routes.home);
     Get.forceAppUpdate();
    }
  }
}
