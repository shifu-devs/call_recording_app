import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryAxcentColor()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryAxcentColor()),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 18,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 100,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor(),
        // textTheme: TextTheme(),
        iconTheme: IconThemeData(color: Colors.white, size: 25))

    // iconButtonTheme: IconButtonThemeData(style: ButtonStyle())
    );
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
