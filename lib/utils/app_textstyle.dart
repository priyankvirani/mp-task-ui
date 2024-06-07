import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle customTextStyle(
      {color = Colors.black,
      fontSize,
      fontWeight,
      fontFamily = 'Euclid',
      letterSpacing,
      height,
      fontStyle}) {
    return TextStyle(
        height: height,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily);
  }
}
