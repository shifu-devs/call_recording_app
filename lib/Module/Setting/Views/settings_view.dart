import 'package:call_recording_app/Module/Setting/Views/settings_audio_source_view.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:call_recording_app/Utills/Customs/Drawer/Components/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "Setting",
        isBackButton: true,
        backOnPressed: () => Get.back(),
        textColor: AppColors.background,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppConfig(context).width / 30,
          vertical: 10,
        ),
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
          Divider(),
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
          Divider(),
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
        ],
      ),
    );
  }
}
