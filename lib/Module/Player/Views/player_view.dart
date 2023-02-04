
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import '/module/player/components/audio_player.dart';
import '/module/player/components/file_detail_card.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerView extends StatelessWidget {
  String source;
  String fileName;

  PlayerView({this.source = "", this.fileName = "", Key? key})
      : super(key: key);

  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    File file = File(source);
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

    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: fileName,
        textColor: Colors.white,
        isBackButton: true,
        backOnPressed: () async {
          await audioPlayer.stop();
          await audioPlayer.dispose();
          Get.back();
        },
        isCenterTitle: true,
        isPlayer: true,
        delteIconPressed: () {},
        shareIconPressed: () {},
        starIconPressed: () {},
      ),
      body: ListView(
        children: [
          DelayedDisplay(
            delay: Duration(milliseconds: 200),
            child: FileDetailCard().fileDetails(
              context: context,
              fileLocation: source != ""
                  ? source.substring(19)
                  : "sdcard/CallRecordings/62_55_6asda_asd_song_asdbs_asdbhbhaxhabs.mps",
              fileName: fileName != ""
                  ? fileName
                  : "62_55_6asda_asd_song_asdbs_asdbhbhaxhabs.mps",
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
              child:
                  MyAudioPlayer(audioPlayer: audioPlayer, sourcePath: source),
            ),
          ),
        ],
      ),
    );
  }
}
