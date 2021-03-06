import 'package:flutter/material.dart';
import 'package:shopy/helper/Binding.dart';
import 'package:shopy/view/auth/LogIn.dart';
import 'package:shopy/view/home/Home_V.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopy/view/ControlView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: ControlView(),
    );
  }
}
