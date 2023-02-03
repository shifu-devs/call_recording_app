import 'dart:async';
import 'dart:io';

import 'package:call_recording_app/app_services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/voice_recorder_model.dart';

class VoiceRecordingViewModel extends GetxController {
  RxBool isRecordingStarted = false.obs;
  RxBool isRecordingFirstTime = false.obs;
  RxString audioPath = "".obs;
  RxBool isFavourite = false.obs;

  final saveTextFieldController = TextEditingController().obs;

  RxBool removePlayerFromScreen = false.obs;

  Future<bool> copyFile(String sourcePath) async {
    bool isDone = false;
    try {
      DateTime createdAt = DateTime.now();
      String destinationDir =
          "/storage/emulated/0/Call Recording App/My Voices";

      String newFileName =
          "${saveTextFieldController.value.text.trim().replaceAll(" ", "_")}_${createdAt.millisecondsSinceEpoch.toString()}.m4a";
      final desDir = Directory(destinationDir);
      if (!await desDir.exists()) {
        await desDir.create(recursive: true);
      }

      final sourceFile = File(sourcePath);
      final destinationFile = File("$destinationDir/$newFileName");
      await sourceFile.copy(destinationFile.path);
      await insertDetailsIntoDatabase(
        createdAt.millisecondsSinceEpoch.toString(),
        "$destinationDir/$newFileName",
      );
      print("File copied and db inserted");
      saveTextFieldController.value.text = "";
      isDone = true;
    } catch (e) {
      print(">>>>>>>>>>>>>>> " + e.toString() + " <<<<<<<<<<<<<<<<<<<<<<<");
    }
    return isDone;
  }

  Future<void> insertDetailsIntoDatabase(String createdAt, String path) async {
    String fileName = "My Recording";
    if (saveTextFieldController.value.text.trim() != "") {
      fileName = saveTextFieldController.value.text.trim();
    }

    await DbHelper.insertMyRecording(MyRecordingsModel.toMap(
      fileName,
      createdAt,
      isFavourite.value,
      path,
    ));
  }

  Future<void> deleteFile(String filePath) async {
    try {
      isRecordingFirstTime.value = false;
      Timer(
          Duration(
            milliseconds: 100,
          ), () async {
        File file = File(filePath);
        await file.delete();
        // print("File Deleted");
      });
    } catch (e) {
      print(e);
    }
  }
}
