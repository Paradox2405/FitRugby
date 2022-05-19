import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/models/colors_data.dart';
import 'package:fitrugby/onlineworkout/online_workouts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/Routes.dart';

class OnlineWorkoutsPage extends GetView<OnlineWorkoutsController> {
  @override
  final OnlineWorkoutsController controller = Get.put(OnlineWorkoutsController());

  OnlineWorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineWorkoutsController>(
      init: OnlineWorkoutsController(),
      builder: (controller) {
        return Scaffold(
          appBar: null,
          bottomNavigationBar: NavBar(),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bgmain.png'), fit: BoxFit.cover)),
              padding: EdgeInsets.all(10),
              child: controller.loading
                  ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator())
                  :Column(
                    children: [
                      Expanded(
                        child:
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 100),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        padding: EdgeInsets.all(5),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:controller.itemsLength,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap:()=>{ Get.toNamed(Routes.selectedonlineworkout,arguments: controller.workoutData.docs[index].data())},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 4, top: 4),
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Color(myBgColors[myBgColors.indexWhere((element) => element.name==controller.workoutData.docs[index].data()["color"])].color.value),
                                                borderRadius:
                                                BorderRadius.circular(20),
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
                                                    children: [
                                                      Column(
                                                        children:[
                                                          Image.asset("assets/rugbyplayer.png",scale: 2,)

                                                        ],
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children:[
                                                          Text(
                                                            controller.workoutData.docs[index].data()["title"],
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                            softWrap: false,
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                FontWeight.w400),

                                                          ),

                                                        ],
                                                      ),


                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () => {
                          controller.refreshItems(),
                        },
                        child: Text(
                          "REFRESH",
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
                    ],
                  ),

            ),
          ),
        );
      },
    );
  }
}
