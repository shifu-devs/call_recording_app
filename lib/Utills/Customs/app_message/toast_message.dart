import '/utills/app_theme/AppColors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../app_text/app_text.dart';

class ToastMessage {
  static toast({String message = "Message"}) {
    return Get.snackbar(
      "Information",
      message,
      messageText: AppText.text(
        message,
        fontsize: 18,
        fontweight: FontWeight.w600,
        color: AppColors.background,
      ),
      animationDuration: Duration(milliseconds: 500),
      duration: Duration(milliseconds: 1600),
      backgroundColor: AppColors.dark,
      borderRadius: 12,
      colorText: AppColors.background,
      padding: EdgeInsets.all(12),
    );
  }

  defaultYesNoDialouge(
    String title, {
    GestureTapCallback? onCancelPressed,
    GestureTapCallback? onConfirmPressed,
  }) {
    return Get.defaultDialog(
      cancelTextColor: AppColors.primaryColor(),
      confirmTextColor: Colors.red,
      backgroundColor: Colors.white,
      title: "Confirmation",
      titleStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor(),
      ),
      middleTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.dark,
      ),
      middleText: title,
      cancel: InkWell(
        onTap: () {
          onCancelPressed!();
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(
              "Cancel",
              color: AppColors.background,
            ),
          ),
        ),
      ),
      confirm: InkWell(
        onTap: () {
          onConfirmPressed!();
          // print("Confrim pressed");
        },
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText.text(
              "Delete",
              color: AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}
