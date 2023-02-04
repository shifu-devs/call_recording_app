import '/module/setting/view_model/settings_view_model.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/customs/app_button/app_button.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';

class AppPasswordView extends StatefulWidget {
  const AppPasswordView({Key? key}) : super(key: key);

  @override
  State<AppPasswordView> createState() => _AppPasswordViewState();
}

class _AppPasswordViewState extends State<AppPasswordView> {
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
                VerificationCode(
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
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
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
