import '/module/lock/views/app_password_view.dart';
import '/module/setting/view_model/settings_view_model.dart';
import '/module/setting/views/settings_audio_source_view.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/customs/drawer/components/drawer_tile.dart';
import 'package:flutter/cupertino.dart';
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
