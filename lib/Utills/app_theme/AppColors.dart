import 'package:flutter/material.dart';

class AppColors {
  // ignore: prefer_const_declarations
  static const Color appLightThemeBgColor = Color.fromARGB(255, 66, 136, 122);
  static const Color _accentAppLightThemeColor =
      Color.fromARGB(255, 1, 125, 100);
  static const Color appLightThemBlackColor = Colors.black;
  static const Color background = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color darkPrimaryColor = Color.fromARGB(255, 1, 69, 55);
  static const Color dark = Color.fromARGB(255, 1, 69, 55);
  static const Color tileHighLisgtColor = Color(0xffD6EAE6);
  // static Color textcolour= Color(0xff5B6974);
  // static Color hintcolour= Color(0xffB4B4B4);
  // static Color textfieldbordercolor=Color(0xffE3E3E3);

  ///
  ///
  ///
  static Color primaryColor() {
    return appLightThemeBgColor;
  }

  static Color primaryTextColor() {
    return appLightThemBlackColor;
  }

  static Color primaryAxcentColor() {
    return _accentAppLightThemeColor;
  }
}
