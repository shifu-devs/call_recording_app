import 'package:call_recording_app/Module/Call%20Recordings/Views/all_calls_view.dart';
import 'package:call_recording_app/Module/Dashboard/Views/dashboard_view.dart';

import '/Utills/App%20Theme/theme_const.dart';
import '/Utills/App%20Theme/theme_manager.dart';
import '/Module/Authentication/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    _themeManager.addListener(themeListner);
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _themeManager.addListener(themeListner);
    super.initState();
  }

  themeListner() {
    if (mounted) {
      setState(() {});
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Call Recording App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: DashboardView(),
    );
  }
}
