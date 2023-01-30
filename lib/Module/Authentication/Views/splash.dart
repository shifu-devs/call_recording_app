import 'dart:async';

import 'package:call_recording_app/Module/Dashboard/Views/dashboard_view.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:delayed_display/delayed_display.dart';
// import 'package:call_recording_app/Utills/size_config.dart';
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
    Timer(Duration(seconds: 5), () {
      // print("Onvorarding start");
      Get.offAll(() => DashboardView());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textThem = Theme.of(context).textTheme;
    // IconThemeData _iconTheme = Theme.of(context).iconTheme;
    // ButtonTheme _buttonTheme = Theme.of(context).elevatedButtonTheme;
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
