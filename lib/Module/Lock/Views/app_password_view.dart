import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utills/Customs/App Button/app_button.dart';
import '../../../Utills/Customs/App Text/app_text.dart';
import '../../../Utills/Customs/textfeilds.dart';

class AppPasswordView extends StatelessWidget {
  const AppPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hight = AppConfig(context).height;
    final width = AppConfig(context).width;

    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
          context: context,
          title: "Password",
          isBackButton: true,
          backOnPressed: (() => Get.back()),
          textColor: AppColors.background,
          isCenterTitle: true),
      body: Padding(
        padding: EdgeInsets.all(width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: hight * 0.015),
              child: AppText.text("Old password",
                  textAlignment: TextAlign.left,
                  color: Colors.black,
                  fontsize: 18,
                  fontweight: FontWeight.w600),
            ),
            // SizedBox(height: hight * 0.0001),
            AppTextFormFiled(
              keyboardtype: TextInputType.emailAddress,
              text: "xxxx",
              isNumber: true,
              fontweight: FontWeight.w400,
            ),

            // Divider(),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: hight * 0.015),
              child: AppText.text("New password",
                  textAlignment: TextAlign.left,
                  color: Colors.black,
                  fontsize: 18,
                  fontweight: FontWeight.w600),
            ),
            // SizedBox(height: hight * 0.0001),
            AppTextFormFiled(
              keyboardtype: TextInputType.emailAddress,
              text: "xxxx",
              isNumber: true,
              fontweight: FontWeight.w400,
            ),
            Padding(
              padding: EdgeInsets.only(top: hight * 0.015),
              child: AppText.text("Confirm new password",
                  textAlignment: TextAlign.left,
                  color: Colors.black,
                  fontsize: 18,
                  fontweight: FontWeight.w600),
            ),
            // SizedBox(height: hight * 0.0001),
            AppTextFormFiled(
              keyboardtype: TextInputType.emailAddress,
              text: "xxxx",
              isNumber: true,
              fontweight: FontWeight.w400,
            ),

            SizedBox(
              height: hight * 0.06,
            ),
            Appbutton().primaryButton(
                context: context,
                title: "Change password",
                callback: () {
                  // Get.offAll(() => Dashboard());
                  Get.back();
                }),
            SizedBox(height: hight * 0.02),
          ],
        ),
      ),
    );
  }
}
