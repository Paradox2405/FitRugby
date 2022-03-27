import 'package:fitrugby/data/workout_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SelectedWorkoutController extends GetxController {
  final stopwatch = Stopwatch();
  final List calories=[];
  bool isLoading = true;
  bool started = false;
  final startBtnText= TextEditingController();
  int taps = 0;

  @override
  void onInit() {
    startBtnText.text="START";
    print('>>> WController init');
    update();
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> WController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> WController close');
    super.onClose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void startWorkout(int day, int index) {
    taps++;
    if (taps == 1) {
      startBtnText.text = "FINISH";
      update();
      print(startBtnText.text);
      stopwatch.start();
    } else if (taps == 2) {
      stopwatch.stop();
      Duration elapsed = stopwatch.elapsed;
      for(int i=0;i<mainDataSet[index].subCategory.length;i++){
        calories.add(mainDataSet[index].subCategory[i].calories);
        print(calories[i].toString());
      }
      var totalCalorie = calories.reduce((a, b) => a + b);
      Get.defaultDialog(
        title: "Day " + day.toString(),
        content: Column(
          children: [
            Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),
            Text("Workout Summery",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
            SizedBox(
              height: 10,
            ),
            Text("Calories Burnt",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            Text(totalCalorie.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
            SizedBox(
              height: 10,
            ),
            Text("Workout Time",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
            Text("${_printDuration(elapsed)}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => {
                Get.back(),
              },
              child: Text(
                "DONE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: null,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ],
        ),
      );
      startBtnText.text = "COMPLETED";
      update();
    }
  }
}
