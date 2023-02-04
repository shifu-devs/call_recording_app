
import '/module/my_recordings/view_model/my_recordings_list_view_model.dart';
import '/module/player/views/player_view.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/voice_tile/voice_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Container(
        padding: EdgeInsets.only(top: AppConfig(context).height * 0.01),
        child: Obx(
          () => ListView.builder(
            itemCount: _controller.listOfVoices.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              var i = _controller.listOfVoices;

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
                callDuration: _controller.durationOfVoicesList[index],
                isFav: isFav,
                isGoing: true,
                isRecording: true,
                clickFavIcon: () {
                  _controller.favouriteToogle(
                      i[index].id, i[index].isFav, index);
                },
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
