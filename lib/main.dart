import 'dart:io';
import '/module/dashboard/views/dashboard_view.dart';
import '/utills/app_theme/theme_const.dart';
import '/utills/app_theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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
        await Permission.storage.request();
      }
      final PermissionStatus permissionStatus2 =
          await Permission.manageExternalStorage.status;
      if (permissionStatus2 != PermissionStatus.granted) {
        await Permission.manageExternalStorage.request();
      }
      final PermissionStatus permissionStatus3 =
          await Permission.microphone.status;
      if (permissionStatus3 != PermissionStatus.granted) {
        await Permission.microphone.request();
      }
      final PermissionStatus permissionStatus4 =
          await Permission.contacts.status;
      if (permissionStatus4 != PermissionStatus.granted) {
        await Permission.contacts.request();
      }
      //  final PermissionStatus permissionStatus5 =
      //     await Permission.;
      // if (permissionStatus4 != PermissionStatus.granted) {
      //   await Permission.contacts.request();
      // }
    }
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
