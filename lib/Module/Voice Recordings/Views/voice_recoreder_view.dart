import 'package:call_recording_app/Module/Voice%20Recordings/View%20Model/voice_recording_view_model.dart';
import 'package:get/get.dart';

import '../Components/my_voice_recorder.dart';
import '/Module/Player/Components/audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///// view /////
class VoiceRecorderView extends StatelessWidget {
  VoiceRecorderView({Key? key}) : super(key: key);
  final _controller = Get.put(VoiceRecordingViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
          child: MyVoiceRecorder(
            onStop: (path) {
              if (kDebugMode) print('Recorded file path: $path');

              _controller.audioPath.value = path;
              _controller.isRecordingStarted.value = false;
              _controller.isRecordingFirstTime.value = true;
            },
            onStartPressed: () {
              _controller.isRecordingStarted.value = true;
              _controller.isRecordingFirstTime.value = false;
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _controller.isRecordingFirstTime.value
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: MyAudioPlayer(
                  sourcePath: _controller.audioPath.value,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
