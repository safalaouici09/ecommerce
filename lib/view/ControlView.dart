import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/Palette.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shopy/view/home/home_view.dart';
import 'package:shopy/controller/ControlController.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllController>(
        init: ControllController(),
        builder: (controller) {
          return Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: NavBar(),
          );
        });
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllController>(
        init: ControllController(),
        builder: (controller) {
          return FloatingNavbar(
            backgroundColor: CdarkBlue,
            selectedBackgroundColor: CdarkBlue,
            selectedItemColor: Corange,
            onTap: (int val) {
              controller.getbutom(val);
            },
            currentIndex: controller.navigationIndex,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
              FloatingNavbarItem(icon: Icons.tag, title: 'Discount'),
            ],
          );
        });
  }
}
