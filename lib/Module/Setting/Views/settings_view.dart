import 'package:call_recording_app/module/Lock/Views/app_password_view.dart';
import 'package:call_recording_app/module/Setting/View%20Model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import '/../Module/Setting/Views/settings_audio_source_view.dart';
import '/../Utills/App%20Theme/AppColors.dart';
import '/../Utills/App%20Theme/app_config.dart';
import '/../Utills/Customs/App%20Bar/my_app_bar.dart';
import '/../Utills/Customs/Drawer/Components/drawer_tile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);

  final _controller = Get.put(SettingsViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar().simpleAppBar(
            context: context,
            title: "Setting",
            isBackButton: true,
            backOnPressed: () => Get.back(),
            textColor: AppColors.background,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConfig(context).width / 30,
              vertical: 10,
            ),
            child: Column(
              children: [
                DrawerTile().tile(
                  context: context,
                  icon: Icons.graphic_eq,
                  tileName: "Audio source",
                  fontSize: 18,
                  iconSize: 30,
                  onPressed: () => Get.to(
                    () => SettingAudioSourceView(),
                  ),
                ),
                const Divider(thickness: 1.5),
                DrawerTile().tile(
                  context: context,
                  icon: Icons.file_present,
                  tileName: "File Type",
                  fontSize: 18,
                  iconSize: 30,
                  onPressed: () => Get.to(
                    () => SettingAudioSourceView(),
                  ),
                ),
                const Divider(thickness: 1.5),
                DrawerTile().tile(
                  context: context,
                  icon: Icons.notifications_outlined,
                  tileName: "Notification",
                  fontSize: 18,
                  iconSize: 30,
                  onPressed: () => Get.to(
                    () => SettingAudioSourceView(),
                  ),
                ),
                const Divider(thickness: 1.5),
                DrawerTile().tile(
                    context: context,
                    icon: Icons.lock_outlined,
                    tileName: "App Lock",
                    fontSize: 18,
                    iconSize: 30,
                    suffixWidget: CupertinoSwitch(
                      value: _controller.appLockSwitch.value,
                      activeColor: AppColors.primaryColor(),
                      onChanged: (value) {
                        // _controller.appLockSwitch.value = value;
                        if (value) {
                          Get.to(() => AppPasswordView());
                        } else {
                          _controller.removeAppLockPinToLocalDataSaver();
                        }
                      },
                    ),
                    onPressed: () {}),
                const Divider(thickness: 1.5),
              ],
            ),
          ),
        ));
  }
}
