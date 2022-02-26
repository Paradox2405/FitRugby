import 'package:fitrugby/navbar/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'workout_type_controller.dart';

class WorkoutTypePage extends GetView<WorkoutTypeController> {
  const WorkoutTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: const NavigationBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bgmain.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child:Column(
            children: [
              SizedBox(
                height: 120,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 100),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),)
        ],
      ),
    );
  }
}
