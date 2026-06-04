import 'package:flutter/material.dart';

class AppWidget {

  static TextStyle HeadlineTextStyle(double textSize) {
    return TextStyle(
      color: Colors.black,
      fontSize: textSize,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle WhiteHeadlineTextStyle(double textSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: textSize,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle SimpleTextStyle() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 19,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle ButtonTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold
      
    );
  }

  static TextStyle SuperSimpleTextStyle() {
    return TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500
    );
  }

}