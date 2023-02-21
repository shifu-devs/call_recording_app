import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:call_recording_app/module/player/view_model/player_controller.dart';
import 'package:call_recording_app/utills/customs/app_message/toast_message.dart';
import '/module/voice_recorder/model/voice_recorder_model.dart';
import '/module/player/components/audio_player.dart';
import '/module/player/components/file_detail_card.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerView extends StatelessWidget {
  MyRecordingRead data;

  PlayerView({required this.data, Key? key}) : super(key: key);
  final _controller = Get.put(PlayerController());

  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    _controller.isFavourite.value = data.isFav == "1" ? true : false;
    File file = File(data.path);
    FileStat fileStat = file.statSync();
    int fileSize = fileStat.size;
    double fileSizeMB = fileSize / (1024 * 1024);
    double fileSizeKB = fileSize / 1024;
    String realSize;
    if (fileSizeMB.floor() == 0) {
      realSize = fileSizeKB.toStringAsFixed(2) + " KB";
    } else {
      realSize = fileSizeMB.toStringAsFixed(2) + " MB";
    }

    return Obx(() => WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, {'data': data, 'isDel': false});
            return true;
          },
          child: Scaffold(
            appBar: CustomAppBar().simpleAppBar(
              context: context,
              title: "Player",
              textColor: Colors.white,
              isBackButton: true,
              backOnPressed: () async {
                await audioPlayer.stop();
                await audioPlayer.dispose();
                Get.back(result: {'data': data, 'isDel': false});
              },
              isCenterTitle: false,
              favIconData: _controller.isFavourite.value
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              isPlayer: true,
              delteIconPressed: () async {
                bool val = false;
                await ToastMessage().defaultYesNoDialouge(
                  "Are you sure to delete '${data.title}' recording. Changes in database is permanent.",
                  onConfirmPressed: () {
                    val = true;
                    Get.back();
                  },
                  onCancelPressed: () {
                    val = false;
                    Get.back();
                  },
                );
                if (val) {
                  await audioPlayer.stop();
                  await audioPlayer.dispose();
                  if (await _controller.deleteRecording(data)) {
                    Get.back(result: {'data': data, 'isDel': true});
                  }
                }
              },
              shareIconPressed: () {
                _controller.shareFile(data.path, data.title);
              },
              favIconPressed: () async {
                _controller.isFavourite.value =
                    await _controller.toogleFavourite(
                  data.id,
                  data.isFav,
                );
                data.isFav = _controller.isFavourite.value ? "1" : "0";
                print(data.isFav);
              },
            ),
            body: ListView(
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  child: FileDetailCard().fileDetails(
                    context: context,
                    fileLocation: data.path.substring(19),
                    fileName: data.title,
                    fileSize: realSize,
                  ),
                ),
                SizedBox(
                  height: AppConfig(context).height / 60,
                ),
                Container(
                  margin: EdgeInsets.all(AppConfig(context).width / 35),
                  // padding: EdgeInsets.symmetric(horizontal: 25),
                  height: AppConfig(context).height / 4.5,
                  // color: Colors.red,
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: 300),
                    child: MyAudioPlayer(
                        audioPlayer: audioPlayer, sourcePath: data.path),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
