import 'dart:convert';

import 'package:fitrugby/models/workout_report_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReportsController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  late WorkoutReport workoutReport;
  int itemsCount = 0;
  bool loading = true;
  Map<String,Map> item= {};
  var data;

  @override
  void onInit() {
    update();
    loadData();
    print('>>> HomeController init');
    super.onInit();
  }

  @override
  void onReady() {
    update();
    print('>>> HomeController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> HomeController close');
    super.onClose();
  }

  loadData() async {
    prefs = await _prefs;
    int i=0;
      for(i;prefs.getString('workoutDay$i')!=null;i++){
        item["workout$i"]={};
        var decoded = await jsonDecode(prefs.getString('workoutDay$i').toString());
        workoutReport = WorkoutReport.fromJson(decoded);
        data = {
          "id": workoutReport.id,
          "date": workoutReport.date,
          "time": workoutReport.time,
          "calories": workoutReport.calories
        };
        item["workout$i"]!.addAll(data);
      }
      loading = false;
      update();

  }
}
