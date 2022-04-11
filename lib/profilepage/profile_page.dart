import 'package:fitrugby/home/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  final ProfileController controller = Get.put(ProfileController());

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
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
              child: Column(
                  children:[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 100),
                                    borderRadius: BorderRadius.circular(20)),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'First Name',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.fName,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Last Name',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.lName,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.email,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        obscureText: true,
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.pass,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Weight KG',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.weight,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Height CM',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.height,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          style: TextStyle(
                                              fontSize: (18), color: Colors.black),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            labelText: 'Position',
                                            labelStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          controller: controller.position,
                                          enabled: controller.enabled),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        child: Text(controller.btn.text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                        onPressed: () => {
                                          controller.btn.text=="EDIT"?
                                          controller.onEdit():controller.onSave(),
                                        },
                                      ),

                                  ],
                                ),
                              ),
                            ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(
                              Colors.red)),
                      child: Text("LOGOUT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      onPressed: () => {
                        controller.logout(),
                      },
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
