import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColors {
  // Colors
  static const primaryColor = Color.fromRGBO(48, 175, 37, 1);
  static const accent = Color.fromRGBO(48, 175, 37, 1);
  static const darkPrimaryColor = Color.fromRGBO(48, 170, 37, 1);

  static const backgroundColor = white;
  static const newGreen = Color(0xFF4BD37B);
  static const blendText1 = Color(0xFFB9B9B9);
  static const blendText2 = Color(0xFFDEDEDE);
  static const normalText = Color(0xFF504F4F);

  static const onPrimaryColor = white;
  static const onBackgroundColor = black;

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const neutralGrey = Color.fromRGBO(153, 153, 153, 1);

  static const blue = Color.fromRGBO(44, 86, 164, 1);
  static const amber = Color.fromRGBO(242, 153, 74, 1);
  static const green = Color.fromRGBO(88, 202, 93, 1);
  static const red = Color.fromRGBO(253, 0, 0, 1);
  static const lightRed = Color.fromRGBO(236, 116, 116, 1);
  static const grey = Color.fromRGBO(185, 185, 185, 1);
  static const lightGrey = Color.fromRGBO(0, 0, 0, 0.05);
  static const formFieldLabel = Color.fromRGBO(18, 18, 29, 0.3);

  static const textColorPrimary = black;

  static const signUpBtnBg = Color.fromRGBO(0, 0, 0, 0.3);
  static const verificationBoxBg = Color.fromRGBO(217, 217, 217, 1);
  static const chatNotifContainerBg = Color.fromRGBO(73, 73, 73, 1);

  // Gradients

  static const backgroundGradient2 = LinearGradient(
    colors: [primaryColor, darkPrimaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Shadows
  static const shadow2 = BoxShadow(
    color: Color(0x09004AC2),
    spreadRadius: 10,
    blurRadius: 20,
    offset: Offset(4, 4),
  );
}
