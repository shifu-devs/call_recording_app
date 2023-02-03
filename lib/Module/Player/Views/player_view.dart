// import 'dart:js_util';

import 'package:audioplayers/audioplayers.dart';
import 'package:call_recording_app/module/Player/Components/audio_player.dart';
import 'package:call_recording_app/module/Player/Components/file_detail_card.dart';
// import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:delayed_display/delayed_display.dart';
// import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerView extends StatelessWidget {
  String source;
  PlayerView({this.source = "", Key? key}) : super(key: key);
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "Jabran Haider",
        textColor: Colors.white,
        isBackButton: false,
        backOnPressed: () {
          //   _audioPlayer.stop();
          // _audioPlayer.dispose();
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
              fileLocation:
                  "sdcard/CallRecordings/62_55_6asda_asd_song_asdbs_asdbhbhaxhabs.mps",
              fileName: "62_55_6asda_asd_song_asdbs_asdbhbhaxhabs.mps",
              fileSize: "2.5 MB",
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
