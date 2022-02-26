import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shopy/Palette.dart';
import 'package:shopy/controller/AuthController.dart';
import 'package:shopy/view/auth/SignUp.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LogIn extends GetWidget<AuthController> {
  LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mukta',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in your account  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FormWidget(
                  text: "Email",
                  hintText: "safa@gmail.com",
                ),
                SizedBox(
                  height: 15,
                ),
                FormWidget(
                  text: "Password",
                  hintText: "*******",
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    GestureDetector(
                      onTap: null,
                      child: ColoredContainer(
                        text: "Login in ",
                        color: Corange,
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Or  ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {},
                    ),
                    Text(
                      "not a membre ? Join now",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
