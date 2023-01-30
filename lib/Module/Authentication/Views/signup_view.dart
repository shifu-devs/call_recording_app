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

class SignpView extends StatelessWidget {
  const SignpView({Key? key}) : super(key: key);

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
                    // height: hight * 0.7,
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
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text("Full name",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.0001),
                        AppTextFormFiled(
                          keyboardtype: TextInputType.emailAddress,
                          text: "Uzair Chattha",
                          fontweight: FontWeight.w400,
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text("Username or Email",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.0001),
                        AppTextFormFiled(
                          keyboardtype: TextInputType.emailAddress,
                          text: "Enter your username or email",
                          fontweight: FontWeight.w400,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text("Phone no",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.0001),
                        AppTextFormFiled(
                          keyboardtype: TextInputType.emailAddress,
                          text: "0310xxxxxxx",
                          isNumber: true,
                          fontweight: FontWeight.w400,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text("Password",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.01),
                        AppTextFormFiled(
                          text: "Enter your password",
                          fontweight: FontWeight.w400,
                          isPassword: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text(" Confirm password",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.01),
                        AppTextFormFiled(
                          text: "Retype password",
                          fontweight: FontWeight.w400,
                          isPassword: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: hight * 0.015),
                          child: AppText.text("Address",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 18,
                              fontweight: FontWeight.w600),
                        ),
                        // SizedBox(height: hight * 0.0001),
                        AppTextFormFiled(
                          keyboardtype: TextInputType.emailAddress,
                          text: "Enter your address",
                          fontweight: FontWeight.w400,
                        ),

                        SizedBox(
                          height: hight * 0.03,
                        ),
                        Appbutton().primaryButton(
                            context: context,
                            title: "Create Account",
                            callback: () {
                              // Get.offAll(() => Dashboard());
                              Get.back();
                            }),
                        SizedBox(height: hight * 0.02),
                        Row(
                          children: [
                            AppText.text(
                              "I already have an account ",
                              textAlignment: TextAlign.left,
                              color: Colors.black,
                              fontsize: 12,
                            ),
                            InkWell(
                              onTap: () => Get.back(),
                              child: AppText.text(
                                "Login",
                                textAlignment: TextAlign.left,
                                color: AppColors.primaryColor(),
                                fontsize: 15,
                                fontweight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: hight * 0.03,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
