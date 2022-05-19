import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';




class OnlineWorkoutsController extends GetxController {
  bool loading = true;
  var collection;
  var workoutData;
  int itemsLength=0;


  @override
  void onInit() {
    getWorkouts();
    print('>>> OnlineController init');
    super.onInit();
  }

  @override
  void onReady() {
    print('>>> OnlineController ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('>>> OnlineController close');
    super.onClose();
  }

  getWorkouts() async {
    print("Getting workouts!!!");
    collection= FirebaseFirestore.instance.collection('workouts');
    collection.get().then((value){
      workoutData=value;
      itemsLength=value.docs.length;
      update();

    });
   loading=false;
   update();

  }

  refreshItems(){
    loading=true;
    update();
    getWorkouts();
    loading=false;
    update();
  }

}
