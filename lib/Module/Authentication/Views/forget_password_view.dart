import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Button/app_button.dart';
import '../../../Utills/Customs/App Text/app_text.dart';
import '../../../Utills/Customs/textfeilds.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
                            child: AppText.text("Forgot Password?",
                                textAlignment: TextAlign.left,
                                color: Colors.black,
                                fontsize: 26,
                                fontweight: FontWeight.w600),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: width * 0.02),
                            width: width / 1.7,
                            child: AppText.text(
                                "Please provide the email address used to change the password",
                                textAlignment: TextAlign.left,
                                color: Color(0xff524B6B),
                                fontsize: 12,
                                fontweight: FontWeight.w400,
                                maxlines: 2),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: hight * 0.08),
                            child: AppText.text("Email",
                                textAlignment: TextAlign.left,
                                color: Colors.black,
                                fontsize: 18,
                                fontweight: FontWeight.w600),
                          ),
                          SizedBox(height: hight * 0.01),
                          AppTextFormFiled(
                            keyboardtype: TextInputType.emailAddress,
                            text: "Enter your email",
                            fontweight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: hight * 0.1,
                          ),
                          Appbutton().primaryButton(
                              context: context,
                              title: "Reset Password",
                              callback: () {})
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
