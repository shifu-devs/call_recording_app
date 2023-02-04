import 'dart:async';
import 'dart:math';

import 'package:call_recording_app/app_services/local_data_saver.dart';
import 'package:call_recording_app/module/dashboard/views/dashboard_view.dart';
import 'package:call_recording_app/Utills/Customs/App%20Message/toast_message.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    initializedVariable();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  initializedVariable() async {
    try {
      bool isAppLock =
          (await AppLocalDataSaver.getBool(AppLocalDataSaver.isAppLockKey))!;
      if (isAppLock == true) {
        appLockSwitch.value = true;
      } else {
        appLockSwitch.value = false;
      }
    } catch (e) {
      appLockSwitch.value = false;
    }
  }

  RxBool appLockSwitch = false.obs;

  setAppLockPinToLocalDataSaver(String pin) async {
    if (pin.length == 4) {
      isLoading.value = true;
      await AppLocalDataSaver.setString(pin, AppLocalDataSaver.appLockPinKey);
      await AppLocalDataSaver.setBool(true, AppLocalDataSaver.isAppLockKey);
      appLockSwitch.value = true;
      isLoading.value = false;
      Get.back();
      ToastMessage.toast(message: "Sucess");
    } else {
      ToastMessage.toast(message: "Enter 4 digit pin.");
    }
  }

  removeAppLockPinToLocalDataSaver() async {
    print("App lock removed");
    await AppLocalDataSaver.setString("", AppLocalDataSaver.appLockPinKey);
    await AppLocalDataSaver.setBool(false, AppLocalDataSaver.isAppLockKey);
    appLockSwitch.value = false;
  }

  Future<bool> checkEnterdPin(String pin) async {
    isLoading.value = true;
    String savedPin;

    try {
      savedPin =
          (await AppLocalDataSaver.getString(AppLocalDataSaver.appLockPinKey))!;
      if (savedPin == pin) {
        isLoading.value = false;
        Get.offAll(() => DashboardView());
        return true;
      } else {
        print("Wrong Pin");
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }
}
