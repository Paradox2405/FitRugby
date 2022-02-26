import 'package:fitrugby/home/home_binding.dart';
import 'package:fitrugby/home/home_page.dart';
import 'package:fitrugby/login/login_page.dart';
import 'package:fitrugby/profilepage/profile_binding.dart';
import 'package:fitrugby/profilepage/profile_page.dart';
import 'package:fitrugby/welcome/welcome_page.dart';
import 'package:fitrugby/workouttype/workout_type_binding.dart';
import 'package:fitrugby/workouttype/workout_type_page.dart';
import 'package:get/get.dart';

class Routes{
  static final String welcome = "/welcome_page";
  static final String login= "/login_page";
  static final String home = "/home_page";
  static final String workouttype = "/workout_type_page";
  static final String profile = "/profile_page";



  static final routes =[
    GetPage(
      name: Routes.welcome,
      page: ()=> WelcomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: ()=> LoginPage(),
    ),
    GetPage(
      name: Routes.home,
      page: ()=> HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.workouttype,
      page: ()=> WorkoutTypePage(),
      binding: WorkoutTypeBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: ()=> ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}