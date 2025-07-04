import 'package:firebase_core/firebase_core.dart';
import 'package:fitrugby/routes/Routes.dart';
import 'package:fitrugby/welcome/welcome_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}
Future<void> initServices() async{
  await Firebase.initializeApp();


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fit Rugby',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcome,
      getPages: Routes.routes,
      initialBinding: WelcomeBinding(),
    );
  }

}
