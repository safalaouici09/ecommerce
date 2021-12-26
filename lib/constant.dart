import 'package:flutter/cupertino.dart';
import 'package:shopy/Palette.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  var label;
  var size;
  var color; //  = Colors.black;
  var weight;
  MyText({this.label, this.color, this.size, this.weight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Mukta',
        color: color,
      ),
    );
  }
}
