import 'package:google_fonts/google_fonts.dart';

import '../../../utills/flutter_pin_code.dart';
import '/module/setting/view_model/settings_view_model.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/customs/app_button/app_button.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AppPasswordView extends StatelessWidget {
  AppPasswordView({Key? key}) : super(key: key);
  TextEditingController newTextEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();
  final _controller = Get.find<SettingsViewModel>();

  bool _onEditing = true;

  String _code = "";

  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Obx(() => Scaffold(
          appBar: CustomAppBar().simpleAppBar(
              context: context,
              title: "Set Lock",
              isBackButton: true,
              backOnPressed: (() => Get.back()),
              textColor: AppColors.background,
              isCenterTitle: true),
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
                    "Enter 4-digit pin to lock APP",
                    fontsize: 35,
                    fontweight: FontWeight.w700,
                    maxlines: 2,
                    textAlignment: TextAlign.start,
                    color: AppColors.primaryColor(),
                  ),
                ),
                PinCodeFields(
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
                  },
                  activeBorderColor: Colors.orange,
                  borderColor: AppColors.primaryColor(),
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
                        title: "Set Lock",
                        borderradius: 10,
                        fontsize: 18,
                        callback: () {
                          _controller.setAppLockPinToLocalDataSaver(_code);
                        })
              ],
            ),
          ),
        ));
  }
}
