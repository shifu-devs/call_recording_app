import 'package:call_recording_app/module/Authentication/Views/signup_view.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Button/app_button.dart';
import '../../../Utills/Customs/App Text/app_text.dart';
import '../../../Utills/Customs/textfeilds.dart';
// import '../../Dashboard/Views/Dashboard.dart';
import 'forget_password_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Scaffold(
      body: Container(
        height: AppConfig(context).height,
        width: AppConfig(context).width,
        color: AppColors.primaryColor(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: hight * 0.3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 500),
                        child: Container(
                          height: hight * 0.15,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/app_logo.png"),
                            ),
                          ),
                        ),
                      ),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 700),
                        child: AppText.nameText("ACRA",
                            color: Colors.white,
                            fontweight: FontWeight.w300,
                            fontsize: 32),
                      ),
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 900),
                        child: AppText.text("Android Call Recording App",
                            color: Colors.white,
                            fontweight: FontWeight.w400,
                            fontsize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              DelayedDisplay(
                  delay: Duration(seconds: 1),
                  child: Container(
                    height: hight * 0.7,
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    width: width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: width * 0.02),
                            child: AppText.text("Username",
                                textAlignment: TextAlign.left,
                                color: Colors.black,
                                fontsize: 18,
                                fontweight: FontWeight.w600),
                          ),
                          SizedBox(height: hight * 0.01),
                          AppTextFormFiled(
                            keyboardtype: TextInputType.emailAddress,
                            text: "Enter your username",
                            fontweight: FontWeight.w400,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: width * 0.15),
                            child: AppText.text("Password",
                                textAlignment: TextAlign.left,
                                color: Colors.black,
                                fontsize: 18,
                                fontweight: FontWeight.w600),
                          ),
                          SizedBox(height: hight * 0.01),
                          AppTextFormFiled(
                            text: "Enter your password",
                            fontweight: FontWeight.w400,
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (() {
                                  Get.to(() => SignpView());
                                }),
                                child: AppText.text("Create new account",
                                    fontsize: 12,
                                    fontweight: FontWeight.w400,
                                    color: AppColors.appLightThemBlackColor),
                              ),
                              InkWell(
                                onTap: (() {
                                  Get.to(() => ForgetPasswordView());
                                }),
                                child: AppText.text("Forgot Password?",
                                    fontsize: 12,
                                    fontweight: FontWeight.w400,
                                    color: Color(0xff707070)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: hight * 0.03,
                          ),
                          Appbutton().primaryButton(
                              context: context,
                              title: "Login",
                              callback: () {
                                // Get.offAll(() => Dashboard());
                                Get.back();
                              })
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
