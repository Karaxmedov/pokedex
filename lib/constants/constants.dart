import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String imagePath = "images\/pokeball.png";

  static const String title = "Pokedex";
  static TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(40),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(18),
    );
  }

  static TextStyle getTypechipTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(16),
    );
  }

  static TextStyle getPokemonInfoLabelTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: _calculateInfoFontSize(20),
    );
  }

  static TextStyle getPokemonInfoTextStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: _calculateInfoFontSize(16),
    );
  }

  static _calculateFontSize(double size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.w.sp;
    } else {
      return (size.h * 0.9).sp;
    }
  }

  static _calculateInfoFontSize(double size) {
    if (ScreenUtil().orientation == Orientation.landscape) {
      return size.h;
    } else {
      return size.w;
    }
  }
}
