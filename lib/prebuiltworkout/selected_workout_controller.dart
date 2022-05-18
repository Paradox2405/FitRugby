import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fitrugby/models/workout_data.dart';
import 'package:fitrugby/models/workout_report_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SelectedWorkoutController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  WorkoutReport saveReport = WorkoutReport();
  DateTime now = DateTime.now();
  int dataItem = Get.arguments[0];
  bool watch = false;
  final isHours = true;
  final StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );
  final stopwatch = Stopwatch();
  final List calories = [];
  bool started = false;
  final startBtnText = TextEditingController();
  int taps = 0;
  bool completed = false;

  @override
  void onInit() {
    startBtnText.text = "START";
    print('>>> WController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> WController ready');
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    await stopWatchTimer.dispose();
    print('>>> WController close');
    super.onClose();
  }

  // initialVal() async {
  //   final SharedPreferences prefs = await _prefs;
  //   completed = prefs.getBool('day$dataItem')!;
  //   counter = prefs.getInt('counter')!;
  // }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes);
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> startWorkout(int day, int index) async {
    final SharedPreferences prefs = await _prefs;
    taps++;
    int? counter;
    int? indexVal;
    String formattedDate = DateFormat("yyyy-MM-dd").format(now);
    if (taps == 1) {
      startBtnText.text = "FINISH";
      watch = true;
      update();
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
      stopwatch.start();
    } else if (taps == 2) {
      stopWatchTimer.onExecute.add(StopWatchExecute.stop);
      stopwatch.stop();
      Duration elapsed = stopwatch.elapsed;
      for (int i = 0; i < mainDataSet[index].subCategory.length; i++) {
        calories.add(mainDataSet[index].subCategory[i].calories);
      }
      var totalCalorie = calories.reduce((a, b) => a + b);

      Get.defaultDialog(
        barrierDismissible: false,
        title: "Day " + day.toString(),
        content: Column(
          children: [
            Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),
            Text(
              "Workout Summery",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Workout Time",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              "${_printDuration(elapsed)}",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async => {
                counter = prefs.getInt('counter'),
                await prefs.setBool('day$day', true),
                await prefs.setInt('counter', counter! + 2),
                indexVal = prefs.getInt('indexVal'),
                saveReport.id = indexVal,
                saveReport.date = formattedDate,
                saveReport.time = _printDuration(elapsed).toString(),
                saveReport.calories = totalCalorie.toString(),
                await prefs.setString(
                    'workoutDay$indexVal', json.encode(saveReport)),
                await prefs.setInt('indexVal', indexVal! + 1),
                update(),
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
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
        ),
      );
      startBtnText.text = "COMPLETED";
      update();
    }
  }
}
