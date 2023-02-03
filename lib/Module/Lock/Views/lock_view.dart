import 'dart:math';
import '/Utills/Customs/App%20Text/app_text.dart';
import '/module/Setting/View%20Model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:spring/spring.dart';
import '../../../Utills/App Theme/AppColors.dart';
import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Button/app_button.dart';

class EnterPinView extends StatefulWidget {
  const EnterPinView({Key? key}) : super(key: key);

  @override
  State<EnterPinView> createState() => _EnterPinViewState();
}

class _EnterPinViewState extends State<EnterPinView> {
  final _controller = Get.put(SettingsViewModel());

  bool _onEditing = true;
  String _code = "";

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
                  child: VerificationCode(
                    fullBorder: true,
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor()),
                    keyboardType: TextInputType.number,
                    underlineColor: AppColors
                        .primaryColor(), // If this is null it will use primaryColor: Colors.red from Theme
                    length: 4,
                    cursorColor: AppColors
                        .primaryColor(), // If this is null it will default to the ambient
                    // clearAll is NOT required, you can delete it
                    // takes any widget, so you can implement your design
                    clearAll: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'clear all',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.all(12),
                    onCompleted: (String value) async {
                      // setState(() {
                      _code = value;
                      // });
                      if (_code.length == 4) {
                        if (await _controller.checkEnterdPin(_code)) {
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        }
                      }
                    },
                    onEditing: (bool value) {
                      // setState(() {
                      _onEditing = value;
                      // });
                    },
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
                            _controller.checkEnterdPin(_code);
                          } else {
                            springController.play(
                              animDuration: Duration(milliseconds: 500),
                            );
                          }
                        })
              ],
            ),
          ),
        ));
  }
}
