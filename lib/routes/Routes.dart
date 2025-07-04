import 'package:fitrugby/home/home_binding.dart';
import 'package:fitrugby/home/home_page.dart';
import 'package:fitrugby/login/login_binding.dart';
import 'package:fitrugby/login/login_page.dart';
import 'package:fitrugby/prebuiltworkout/prebuilt_workout_selection_binding.dart';
import 'package:fitrugby/prebuiltworkout/prebuilt_workout_selection_page.dart';
import 'package:fitrugby/prebuiltworkout/selected_workout_binding.dart';
import 'package:fitrugby/prebuiltworkout/selected_workout_page.dart';
import 'package:fitrugby/profilepage/profile_binding.dart';
import 'package:fitrugby/profilepage/profile_page.dart';
import 'package:fitrugby/profilesetup/profile_setup_binding.dart';
import 'package:fitrugby/profilesetup/profile_setup_page.dart';
import 'package:fitrugby/registration/registration_page.dart';
import 'package:fitrugby/welcome/welcome_binding.dart';
import 'package:fitrugby/welcome/welcome_page.dart';
import 'package:fitrugby/workouttype/workout_type_binding.dart';
import 'package:fitrugby/workouttype/workout_type_page.dart';
import 'package:get/get.dart';
import '../onlineworkout/online_workouts_binding.dart';
import '../onlineworkout/online_workouts_page.dart';
import '../onlineworkout/selected_onlineworkout_binding.dart';
import '../onlineworkout/selected_onlineworkout_page.dart';
import '../reports/reports_binding.dart';
import '../reports/reports_page.dart';

class Routes{
  static final String welcome = "/welcome_page";
  static final String login= "/login_page";
  static final String registration= "/registration_page";
  static final String profilesetup = "/profile_setup_page";
  static final String home = "/home_page";
  static final String workouttype = "/workout_type_page";
  static final String profile = "/profile_page";
  static final String prebuiltselection = "/prebuilt_workout_selection_page";
  static final String selectedworkout = "/selected_workout_page";
  static final String reports = "/reports_page";
  static final String onlineworkout = "/online_workouts_page";
  static final String selectedonlineworkout = "/selected_onlineworkout_page";



  static final routes =[
    GetPage(
      name: Routes.welcome,
      page: ()=> WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: ()=> LoginPage(),
      binding: LoginBinding(),
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
    GetPage(
      name: Routes.registration,
      page: ()=> RegistrationPage(),
    ),
    GetPage(
      name: Routes.profilesetup,
      page: ()=> ProfileSetupPage(),
      binding: ProfileSetupBinding(),
    ),
    GetPage(
      name: Routes.prebuiltselection,
      page: ()=> PrebuiltWorkoutSelectionPage(),
      binding: PrebuiltWorkoutSelectionBinding(),
    ),
    GetPage(
      name: Routes.selectedworkout,
      page: ()=> SelectedWorkoutPage(),
      binding: SelectedWorkoutBinding(),
    ),
    GetPage(
      name: Routes.reports,
      page: ()=> ReportsPage(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: Routes.onlineworkout,
      page: ()=> OnlineWorkoutsPage(),
      binding: OnlineWorkoutsBinding(),
    ),
    GetPage(
      name: Routes.selectedonlineworkout,
      page: ()=> SelectedOnlineWorkoutPage(),
      binding: SelectedOnlineWorkoutBinding(),
    ),
  ];
}