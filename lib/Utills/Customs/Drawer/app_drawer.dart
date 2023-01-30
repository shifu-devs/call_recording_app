import 'package:call_recording_app/Module/Authentication/Views/login_view.dart';
import 'package:call_recording_app/Module/Setting/Views/settings_audio_source_view.dart';
import 'package:call_recording_app/Module/Setting/Views/settings_view.dart';
import 'package:call_recording_app/Module/Voice%20Recordings/Views/voice_recoreder_view.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:call_recording_app/Utills/Customs/Drawer/Components/drawer_tile.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              tileName: "Share this app",
            ),
          ],
        ));
  }
}
