import 'package:get/get.dart';
import 'package:shopy/controller/AuthController.dart';
import 'package:shopy/controller/CartViewController.dart';
import 'package:shopy/controller/HomeViewController.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeViewController());
    Get.lazyPut(() => CartViewController());
  }
}
