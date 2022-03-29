import 'package:fitrugby/profilesetup/profile_setup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupPage extends StatelessWidget {
 final ProfileSetupController controller =Get.put(ProfileSetupController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 60),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller:controller.fName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'First Name',
                      ),
                    ),
                    TextField(
                      controller:controller.lName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Last Name',
                      ),
                    ),
                    TextField(
                      controller:controller.weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Weight in KG',
                      ),
                    ),
                    TextField(
                      controller:controller.height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Height in CM',
                      ),
                    ),
                    TextField(
                      controller:controller.position,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Playing position',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(180, 60),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        controller.registerUser();
                      },
                      child: Text("Finish Setup",style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
