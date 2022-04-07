import 'package:fitrugby/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends GetView<HomeController>{
   NavBar({Key? key}) : super(key: key);
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
    builder: (controller){
    return BottomNavigationBar(
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.candlestick_chart),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: controller.changeNavPage,
      currentIndex: controller.tabIndex,
    );
    },);
  }
}