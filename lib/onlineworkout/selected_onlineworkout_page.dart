import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/onlineworkout/selected_onlineworkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/colors_data.dart';


class SelectedOnlineWorkoutPage extends GetView<SelectedOnlineWorkoutController> {
  @override
  final SelectedOnlineWorkoutController controller =
      Get.put(SelectedOnlineWorkoutController());

  SelectedOnlineWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectedOnlineWorkoutController>(
      init: SelectedOnlineWorkoutController(),
      builder: (controller) {
        return Scaffold(
          appBar: null,
          bottomNavigationBar: NavBar(),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover)),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 80, 20, 10),
              child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(myBgColors[myBgColors.indexWhere((element) => element.name==controller.workoutData['color'])].color.value),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(15, 5, 5, 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular((8)),
                                              color: Colors.red),
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.black,
                                            size: 25,
                                          )),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      controller.workoutData['title'].toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.blueGrey,
                                  thickness: 1,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount:controller.newWorkoutData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: 2, top: 2),
                                          padding: EdgeInsets.all(25),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.black.withAlpha(15),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                        controller.newWorkoutData[index].toString(),
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                    ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
