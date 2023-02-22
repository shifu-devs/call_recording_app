import 'package:call_recording_app/app_services/local_notifications_service.dart';

import '/utills/app_theme/AppColors.dart';
import '/module/Authentication/views/login_view.dart';
import '/module/Setting/Views/settings_view.dart';
import '/module/my_recordings/views/my_recordings_view.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../module/voice_recorder/Views/voice_recoreder_view.dart';
import 'components/drawer_tile.dart';

class AppDrawer {
  drawer({required BuildContext context, required Function tilePressed}) {
    return Drawer(
        backgroundColor: AppColors.background,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              height: AppConfig(context).height / 5,
              color: AppColors.primaryColor(),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  child: AppText.text(
                    "Call Recorder",
                    color: AppColors.background,
                    fontsize: 25,
                    fontweight: FontWeight.w700,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.cloud,
              tileName: "Cloud account",
              onPressed: () {
                Get.to(() => LoginView());
                tilePressed();
              },
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.mic,
              tileName: "Voice Recorder",
              onPressed: () {
                Get.to(() => VoiceRecorderView());
                tilePressed();
              },
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.my_library_music_sharp,
              tileName: "Voice Recordings",
              onPressed: () {
                Get.to(() => MyRecordingsView());
                tilePressed();
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              endIndent: 10,
              indent: 10,
              thickness: 1,
              color: AppColors.dark.withOpacity(0.2),
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.settings,
              tileName: "Settings",
              onPressed: () {
                Get.to(() => SettingsView());
                tilePressed();
              },
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.share,
              tileName: "Share app",
              onPressed: () {
                LocalNotificationsService.sendNotification(
                    "Title of notfication", "This is body");
              },
            ),
            DrawerTile().tile(
              context: context,
              icon: Icons.star_half_rounded,
              tileName: "Rate app",
              onPressed: () {
                LocalNotificationsService.setSecheduleNotification(
                    "Title of notfication", "This is body");
              },
            ),
          ],
        ));
  }
}
