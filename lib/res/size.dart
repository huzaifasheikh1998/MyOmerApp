import 'package:flutter/material.dart';

class Sized {
  BuildContext context;
  static late MediaQueryData mediaQueryData;
  late double screenHeight;
  late double screenWidth;
  late double primaryMargin;

  Sized(this.context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;
    primaryMargin = screenHeight * 0.01;
  }

  double height(double value) {
    return value * screenHeight;
  }

  double width(double value) {
    return value * screenWidth;
  }
}
