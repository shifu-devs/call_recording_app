import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
}
