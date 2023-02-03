// import 'package:audioplayers/audioplayers.dart';
import '../view_model/my_recordings_list_view_model.dart';
import '/Utills/App%20Theme/AppColors.dart';
import '/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Voice Tile/voice_tile.dart';
import '../../Player/Views/player_view.dart';

class MyRecordingsView extends StatelessWidget {
  MyRecordingsView({Key? key}) : super(key: key);
  final _controller = Get.put(MyRecordingsListViewModel());
  // final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "My Recordings",
        textColor: AppColors.background,
        isCenterTitle: true,
        isBackButton: true,
        backOnPressed: () {
          Get.back();
        },
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(top: AppConfig(context).height * 0.01),
          child: ListView.builder(
            itemCount: _controller.listOfVoices.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              var i = _controller.listOfVoices;
              // audioPlayer.setSourceDeviceFile(i[index].path);
              // final vad = audioPlayer.getDuration();
              // audioPlayer.dispose();

              DateTime createdAt =
                  DateTime.fromMillisecondsSinceEpoch(i[index].createdAt);
              final hour = createdAt.hour.toString();
              final mint = createdAt.minute.toString();
              final sec = createdAt.second.toString();
              final day = createdAt.day.toString();
              final month = createdAt.month.toString();
              final year = createdAt.year.toString();
              final dateTime = "$year/$month/$day $hour:$mint:$sec";
              bool isFav = i[index].isFav.toString() == "1" ? true : false;
              return VoiceTile().allCallsTile(
                context: context,
                callerName: i[index].title,
                callDateTime: dateTime,
                callDuration: "",
                isFav: isFav,
                isGoing: true,
                isRecording: true,
                clickFavIcon: () {},
                onTapTile: () {
                  Get.to(() => PlayerView(
                        source: i[index].path,
                        fileName: i[index].title,
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
