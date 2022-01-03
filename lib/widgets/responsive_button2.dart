import 'package:flutter/material.dart';

import '../colors.dart';
import 'app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(child: Image.asset('images/adobe_logo.png')),
    );
  }
}
