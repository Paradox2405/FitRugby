import 'package:fitrugby/home/navigation_bar.dart';
import 'package:fitrugby/reports/reports_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsPage extends GetView<ReportsController> {
  @override
  final ReportsController controller = Get.put(ReportsController());

  ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportsController>(
      init: ReportsController(),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Date",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text("Duration",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text("Cals",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        padding: EdgeInsets.all(5),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: controller.item.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                bottom: 4, top: 4),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(200,0,0, 1),
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
                                                IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(padding: EdgeInsets.all(14),child: Text(controller.item["workout$index"]?.entries.elementAt(1).value,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                      VerticalDivider(width: 1,color: Colors.blueGrey,thickness: 1,),
                                                       Container(padding: EdgeInsets.all(14),child: Text(controller.item["workout$index"]?.entries.elementAt(2).value+" Min",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                      VerticalDivider(width: 1,color: Colors.blueGrey,thickness: 1,),
                                                      Container(padding: EdgeInsets.all(14),child: Text(controller.item["workout$index"]?.entries.elementAt(3).value+" Cal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                                                    ],
                                                  ),
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
