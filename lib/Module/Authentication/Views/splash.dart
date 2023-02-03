import 'dart:async';
import '/app_services/local_data_saver.dart';
import '/module/Dashboard/Views/dashboard_view.dart';
import '/module/Lock/Views/lock_view.dart';
import '/Utills/App%20Theme/AppColors.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initVar();
  }

  initVar() async {
    bool isLockSet;
    try {
      isLockSet =
          (await AppLocalDataSaver.getBool(AppLocalDataSaver.isAppLockKey))!;
    } catch (e) {
      isLockSet = false;
    }
    Timer(Duration(seconds: 3), () {
      // print("Onvorarding start");
      Get.offAll(() => isLockSet ? EnterPinView() : DashboardView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: AppColors.primaryColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RippleAnimation(
                repeat: true,
                color: Colors.white.withOpacity(0.5),
                minRadius: 90,
                ripplesCount: 2,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor(),
                  radius: 70,
                  child: const Icon(
                    Icons.mic_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const DelayedDisplay(
                delay: Duration(seconds: 3),
                child: Text(
                  "Call Recorder",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
