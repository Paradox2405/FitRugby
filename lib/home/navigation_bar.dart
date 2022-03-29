import 'package:fitrugby/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBar extends GetView<HomeController>{
   NavigationBar({Key? key}) : super(key: key);
  @override
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.black,
      onTap: controller.changeNavPage,
      currentIndex: controller.tabIndex,
    );
  }

}