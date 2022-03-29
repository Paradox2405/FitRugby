import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        bottomNavigationBar: NavigationBar(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgmain.png'), fit: BoxFit.cover)),
          padding: EdgeInsets.all(10),
          child: controller.loading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome, ${controller.name.text}",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Start your fitness journey\nhere!",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
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
                              Text(
                                "Summery",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Your Position: ${controller.position.text}"),
                              SizedBox(
                                height: 2,
                              ),
                              Text("Your BMI: ${controller.bmi.text}"),
                              SizedBox(
                                height: 2,
                              ),
                              Text("State: ${controller.state.text}"),
                              SizedBox(
                                height: 2,
                              ),
                              Text("Program Completion"),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.blueGrey,
                                width: 170,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${controller.days.text}/30 Days",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 60.0,
                                          lineWidth: 20.0,
                                          percent: controller.percentage!,
                                          center: Text(
                                            "${controller.percentage!*100}%",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          progressColor: Colors.red,
                                          backgroundColor: Colors.redAccent,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Complete",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
