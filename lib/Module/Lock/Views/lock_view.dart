import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

import '../../../utills/flutter_pin_code.dart';
import '/module/setting/view_model/settings_view_model.dart';
import '/utills/customs/app_button/app_button.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spring/spring.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPinView extends StatelessWidget {
  EnterPinView({Key? key}) : super(key: key);

  final _controller = Get.put(SettingsViewModel());

  bool _onEditing = true;

  String _code = "";

  TextEditingController newTextEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();

  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Obx(() => Scaffold(
          body: Padding(
            padding: EdgeInsets.all(width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: hight * 0.20,
                  child: AppText.text(
                    "Enter 4-digit pin to unlock APP",
                    fontsize: 35,
                    fontweight: FontWeight.w700,
                    maxlines: 2,
                    textAlignment: TextAlign.start,
                    color: AppColors.primaryColor(),
                  ),
                ),
                Spring.shake(
                  springController: springController,
                  // delay: Duration(milliseconds: 0),
                  // animDuration: Duration(milliseconds: 500),
                  curve: Curves.easeInExpo,
                  animStatus: (AnimStatus status) {
                    print(status);
                  },
                  child: PinCodeFields(
                    length: 4,
                    autofocus: true,
                    controller: newTextEditingController,
                    focusNode: focusNode,
                    keyboardType: TextInputType.number,
                    animationDuration: Duration(milliseconds: 350),
                    animation: Animations.slideInDown,
                    animationCurve: Curves.linear,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor(),
                    ),
                    onChange: (value) {
                      _code = value;
                    },
                    onComplete: (result) async {
                      // Your logic with code
                      _code = result;
                      if (_code.length == 4) {
                        await _controller.checkEnterdPin(_code);
                      }
                    },
                    activeBorderColor: Colors.orange,
                    borderColor: AppColors.primaryColor(),
                  ),
                ),
                SizedBox(
                  height: hight * 0.10,
                ),
                _controller.isLoading.value
                    ? SpinKitCircle(
                        size: 60,
                        itemBuilder: (context, index) {
                          return DecoratedBox(
                              decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor(),
                          ));
                        },
                      )
                    : Appbutton().primaryButton(
                        context: context,
                        title: "Unloack",
                        borderradius: 10,
                        fontsize: 18,
                        callback: () {
                          if (_code != "") {
                            Timer(Duration(milliseconds: 800), () {
                              _controller.checkEnterdPin(_code);
                            });
                          } else {
                            springController.play(
                              animDuration: Duration(milliseconds: 50),
                            );
                          }
                        })
              ],
            ),
          ),
        ));
  }
}
