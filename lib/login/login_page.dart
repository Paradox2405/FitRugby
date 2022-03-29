import 'package:fitrugby/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 120,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 60),
                        borderRadius: BorderRadius.circular(20),),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 280,
                              child: TextField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Email',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 280,
                              child: TextField(
                                controller: controller.password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Password',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,minimumSize: Size(180, 60),shape: StadiumBorder(),
                                ),
                                onPressed: () {
                                  controller.login();
                                },
                                child: Text("Login"),),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: 120,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,minimumSize: Size(180, 60),shape: StadiumBorder(),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.registration);
                                },
                                child: Text("Sign Up"),),
                            ),
                          ],
                        ),
                        SignInButton(
                            Buttons.Google,
                            elevation: 5,
                            text: "Sign in with Google",
                            onPressed: () => {
                             Get.toNamed(Routes.profilesetup,arguments: ["G"]),
                            }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
