import 'package:fitrugby/data/workout_data.dart';
import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/prebuiltworkout/prebuilt_workout_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:fitrugby/routes/Routes.dart';

class PrebuiltWorkoutSelectionPage
    extends GetView<PrebuiltWorkoutSelectionController> {
  @override
  final PrebuiltWorkoutSelectionController controller=Get.put(PrebuiltWorkoutSelectionController());
  PrebuiltWorkoutSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrebuiltWorkoutSelectionController>(
      init: PrebuiltWorkoutSelectionController(),
      builder: (controller) {
        return Scaffold(
          appBar: null,
          bottomNavigationBar: NavBar(),
          body: controller.loading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 80, 20, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 100),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(10),
                      child: AlignedGridView.count(
                        padding: EdgeInsets.all(10),
                        crossAxisCount: 4,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        itemCount: mainDataSet.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => {
                            controller.prefs.getBool(
                                        'day${mainDataSet[index].day}') ==
                                    true
                                ? Get.snackbar(
                                    "Cannot Start", "Workout Already Completed",
                                    backgroundColor: Colors.white)
                                : Get.toNamed(Routes.selectedworkout,
                                    arguments: [index])
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: (mainDataSet[index].workout == "Rest") ||
                                    controller.prefs.getBool(
                                            'day${mainDataSet[index].day}') ==
                                        true
                                ? Color.fromRGBO(139,0,0, 1)
                                : Colors.redAccent,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  Text(mainDataSet[index].day.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
