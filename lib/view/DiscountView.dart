import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/MyText.dart';
import 'package:shopy/controller/HomeViewController.dart';
import 'package:shopy/Palette.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shopy/view/home/Product_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountView extends StatelessWidget {
  const DiscountView({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 300.0,
        width: 300.0,
        child: SvgPicture.asset(
          'assets/discount.svg',
          fit: BoxFit.fill,
          allowDrawingOutsideViewBox: true,
        ),
      ),
    ));
  }
}
