import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceRecordingViewModel extends GetxController {
  RxBool isRecordingStarted = false.obs;
  RxBool isRecordingFirstTime = false.obs;
  RxString audioPath = "".obs;

  final saveTextFieldController = TextEditingController().obs;

  RxBool removePlayerFromScreen = false.obs;

  void copyFile(
    String sourcePath,
  ) async {
    // print(sourcePath);
    // print(audioPath.value);

    String createdAt = DateTime.now().millisecondsSinceEpoch.toString();
    String destinationDir = "/storage/emulated/0/Call Recording App/My Voices";

    String newFileName = "/" +
        saveTextFieldController.value.text.trim().replaceAll(" ", "_") +
        "_" +
        createdAt +
        ".m4a";
    final desDir = await Directory(destinationDir);
    if (await desDir.exists()) {
    } else {
      await desDir.create(recursive: true);
    }

    // final sourceFile = File(sourcePath);
    // final destinationFile = File(destinationPath);
    // await sourceFile.copy(destinationFile.path);
  }

  Future<void> deleteFile(String filePath) async {
    try {
      isRecordingFirstTime.value = false;
      await Timer(
          Duration(
            milliseconds: 100,
          ), () async {
        File file = File(filePath);
        await file.delete();
        print("File Detelted");
      });
    } catch (e) {
      print(e);
    }
  }
}
