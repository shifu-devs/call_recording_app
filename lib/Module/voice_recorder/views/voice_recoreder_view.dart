import 'dart:async';

import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:call_recording_app/Utills/Customs/App%20Button/app_button.dart';
import 'package:call_recording_app/module/voice_recorder/views/action_voice_recording_view.dart';

import '../view_model/voice_recording_view_model.dart';
import 'package:get/get.dart';
import '../components/my_voice_recorder.dart';
import '/Module/Player/Components/audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///// view /////
class VoiceRecorderView extends StatelessWidget {
  VoiceRecorderView({Key? key}) : super(key: key);
  final _controller = Get.put(VoiceRecordingViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor().withOpacity(0.3),
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "Start Recording",
        isCenterTitle: true,
        textColor: AppColors.background,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.red,
            width: AppConfig(context).width,
            height: AppConfig(context).height * 0.50,
            child: MyVoiceRecorder(
              onStop: (path) async {
                // if (kDebugMode) print('Recorded file path: $path');

                _controller.audioPath.value = path;
                _controller.isRecordingStarted.value = false;
                _controller.isRecordingFirstTime.value = true;
                await Get.to(() => ActionOnVoiceRocrding(), arguments: path);

                await _controller.deleteFile(_controller.audioPath.value);
                _controller.audioPath.value = "";
              },
              onStartPressed: () {
                _controller.isRecordingStarted.value = true;
                _controller.isRecordingFirstTime.value = false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
