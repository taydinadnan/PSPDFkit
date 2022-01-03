import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveButton3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Container(
          color: Colors.white,
          child: Center(child: Image.asset('images/shutter_logo.png'))),
    );
  }
}
