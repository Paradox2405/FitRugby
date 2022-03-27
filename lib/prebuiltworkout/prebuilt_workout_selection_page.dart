import 'package:fitrugby/data/workout_data.dart';
import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/prebuiltworkout/prebuilt_workout_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:fitrugby/routes/Routes.dart';

class PrebuiltWorkoutSelectionPage
    extends GetView<PrebuiltWorkoutSelectionController> {
  const PrebuiltWorkoutSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: const NavigationBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
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
                onTap: ()=>{Get.toNamed(Routes.selectedworkout,arguments: [index])},
                child: Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainDataSet[index].workout=="Rest"?Colors.white70:Colors.red),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          mainDataSet[index].day.toString(),
                          textAlign: TextAlign.center,
                        ),
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
  }
}
