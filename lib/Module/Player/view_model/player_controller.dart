import 'dart:io';

import 'package:call_recording_app/module/voice_recorder/model/voice_recorder_model.dart';
import 'package:get/get.dart';

import '../../../app_services/db_helper.dart';

class PlayerController extends GetxController {
  RxBool isFavourite = false.obs;
  Future<bool> toogleFavourite(String id, String value) async {
    bool val = value == "1" ? false : true;

    await DbHelper.toggleFavVoice(
        tableName: DbHelper.myRecordingTableName, id: id, val: val);
    return val;
  }

  Future<bool> deleteRecording(MyRecordingRead data) async {
    File file = File(data.path); // replace with your file path
    await file.delete().then((value) => print('File deleted successfully!'));
    await DbHelper.deleteVoice(
      tableName: DbHelper.myRecordingTableName,
      id: data.id,
    );
    return true;
  }
}
