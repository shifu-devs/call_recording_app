import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import '/app_services/db_helper.dart';
import '/module/voice_recorder/model/voice_recorder_model.dart';
import 'package:get/get.dart';

class MyRecordingsListViewModel extends GetxController {
  final _audioPlayer = AudioPlayer();
  // RxInt numberOfRecordings = 0.obs;
  final listOfVoices = <MyRecordingRead>[].obs;
  final durationOfVoicesList = <String>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    loadRecoringsFromData();
    super.onInit();
  }

  Future<void> loadRecoringsFromData() async {
    final listdt = await MyRecordingsModel.fetchMyRecordings();

    for (var element in listdt) {
      final file = File(element.path);
      if (await file.exists()) {
        durationOfVoicesList.add(await getDurationOfAudio(element.path));
        listOfVoices.add(element);
      }

      // print(listOfVoices.length.toString() + " List Of Voices Lenght\n");
      // print(durationOfVoicesList.length.toString() +
      //     " Duration Of Voices Lenght\n");
    }
  }

  Future<String> getDurationOfAudio(String path) async {
    await _audioPlayer.setSourceDeviceFile(path);
    final vad = await _audioPlayer.getDuration();
    // await _audioPlayer.stop();
    final dur = vad!.inMicroseconds;

    Duration duration = Duration(microseconds: dur);
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String fromatedDuration = "";
    // hours = 2;
    if (hours.isGreaterThan(0)) {
      if (hours.isLowerThan(10)) {
        fromatedDuration += "0$hours:";
      } else {
        fromatedDuration += "$hours:";
      }
    }

    if (minutes.isLowerThan(10)) {
      fromatedDuration += "0$minutes:";
    } else {
      fromatedDuration += "$minutes:";
    }
    if (seconds.isLowerThan(10)) {
      fromatedDuration += "0$seconds";
    } else {
      fromatedDuration += "$seconds";
    }
    // fromatedDuration += "$minutes:$seconds";

    return fromatedDuration;
  }

  favouriteToogle(String id, String value, int index) async {
    bool val = value == "1" ? false : true;
    listOfVoices[index].isFav = val ? "0" : "1";

    await DbHelper.toggleFavVoice(
        tableName: DbHelper.myRecordingTableName, id: id, val: val);
    listOfVoices.clear();
    durationOfVoicesList.clear();
    await loadRecoringsFromData();
  }

  deleteRecording(int index) async {
    File file = File(listOfVoices[index].path); // replace with your file path
    await file.delete().then((value) => print('File deleted successfully!'));
    await DbHelper.deleteVoice(
      tableName: DbHelper.myRecordingTableName,
      id: listOfVoices[index].id,
    );
  }
}
