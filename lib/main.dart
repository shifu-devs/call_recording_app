import 'dart:io';

import 'package:call_recording_app/module/Dashboard/Views/dashboard_view.dart';
import 'package:permission_handler/permission_handler.dart';

import '/Utills/App%20Theme/theme_const.dart';
import '/Utills/App%20Theme/theme_manager.dart';
import 'module/Authentication/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    getPermissions();
    super.initState();
  }

  void getPermissions() async {
    if (Platform.isAndroid) {
      final PermissionStatus permissionStatus = await Permission.storage.status;
      if (permissionStatus != PermissionStatus.granted) {
        print("storgae");
        await Permission.storage.request();
      }
      final PermissionStatus permissionStatus2 =
          await Permission.manageExternalStorage.status;
      if (permissionStatus2 != PermissionStatus.granted) {
        print("manage external storage");
        await Permission.manageExternalStorage.request();
      }
      final PermissionStatus permissionStatus3 =
          await Permission.microphone.status;
      if (permissionStatus3 != PermissionStatus.granted) {
        print("Microphone");

        await Permission.microphone.request();
      }
    }
    // var status = await Permission.storage.status;
    // if (status.isGranted) {
    //   await Permission.storage.request();
    // }
    // var status1 = await Permission.manageExternalStorage.status;
    // if (status1.isGranted) {
    //   await Permission.manageExternalStorage.request();
    // }
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
