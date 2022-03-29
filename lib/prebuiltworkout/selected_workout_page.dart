import 'package:fitrugby/data/workout_data.dart';
import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/prebuiltworkout/selected_workout_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SelectedWorkoutPage extends GetView<SelectedWorkoutController> {
  @override
  final SelectedWorkoutController controller =
      Get.put(SelectedWorkoutController());

  SelectedWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataItem = Get.arguments[0];
    return Scaffold(
      appBar: null,
      bottomNavigationBar:  NavigationBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 10),
          child: mainDataSet[dataItem].workout == "Rest"
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 100),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
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
                                "DAY " + mainDataSet[dataItem].day.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.blueGrey,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Text(
                              "Rest Day",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 100),
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
                                      padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
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
                                  "DAY " + mainDataSet[dataItem].day.toString(),
                                  style: TextStyle(
                                      fontSize: 30,
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
                                  itemCount:
                                      mainDataSet[dataItem].subCategory.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.only(bottom: 2, top: 2),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withAlpha(15),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  mainDataSet[dataItem]
                                                      .subCategory[index]
                                                      .workout,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              mainDataSet[dataItem]
                                                              .subCategory[
                                                                  index]
                                                              .reps ==
                                                          0 &&
                                                      mainDataSet[dataItem]
                                                              .subCategory[
                                                                  index]
                                                              .workout !=
                                                          "Rest"
                                                  ? Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text("TIME",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "1",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 35),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text("MIN",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "SETS " +
                                                                    mainDataSet[
                                                                            dataItem]
                                                                        .subCategory[
                                                                            index]
                                                                        .sets
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              mainDataSet[
                                                                      dataItem]
                                                                  .subCategory[
                                                                      index]
                                                                  .reps
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 35),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text("REPS",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
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
                    Container(
                        margin: EdgeInsets.all(10),
                        child: controller.watch
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: StreamBuilder<int>(
                                  stream: controller.stopWatchTimer.rawTime,
                                  initialData:
                                      controller.stopWatchTimer.rawTime.value,
                                  builder: (context, snap) {
                                    final value = snap.data!;
                                    final displayTime =
                                        StopWatchTimer.getDisplayTime(value,
                                            hours: controller.isHours);
                                    return Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(255, 255, 255, 100),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            displayTime,
                                            style: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            : null),
                    Container(
                      margin: EdgeInsets.all(10),
                      child:ElevatedButton(
                        onPressed: () => {
                          controller.startWorkout(
                              mainDataSet[dataItem].day, dataItem),
                        },
                        child: TextField(
                          textAlign: TextAlign.center,
                          enabled: false,
                          readOnly: true,
                          controller: controller.startBtnText,
                          style: TextStyle(
                              decoration: null,
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
