import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:call_recording_app/Utills/Customs/textfeilds.dart';
import 'package:call_recording_app/module/voice_recorder/view_model/voice_recording_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Button/app_button.dart';
import '../../Player/Components/audio_player.dart';

class ActionOnVoiceRocrding extends StatelessWidget {
  ActionOnVoiceRocrding({Key? key}) : super(key: key);
  final _audioPlayer = AudioPlayer();
  final _controller = Get.find<VoiceRecordingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor().withOpacity(0.3),
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "My Recording",
        isCenterTitle: true,
        textColor: AppColors.background,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppConfig(context).width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: MyAudioPlayer(
                audioPlayer: _audioPlayer,
                sourcePath: Get.arguments.toString()),
          ),
          SizedBox(height: AppConfig(context).height * 0.10),
          Appbutton().primaryButton(
            context: context,
            title: "Rename & Save",
            fontsize: 18,
            width: AppConfig(context).width * 0.75,
            callback: () {
              Get.dialog(SaveRecordingDialog());
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Appbutton().primaryButton(
            context: context,
            title: "Cancel Recording",
            fontsize: 18,
            width: AppConfig(context).width * 0.75,
            backGroundColor: Color.fromARGB(255, 202, 61, 51),
            callback: () async {
              await _audioPlayer.stop();
              await _audioPlayer.dispose();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class SaveRecordingDialog extends StatelessWidget {
  SaveRecordingDialog({
    super.key,
  });
  final _controller = Get.find<VoiceRecordingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        height: AppConfig(context).height * 0.40,
        width: AppConfig(context).width * 0.90,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.dark,
                  ),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: AppConfig(context).width * 0.02),
                  child: AppText.text("Enter Title",
                      textAlignment: TextAlign.left,
                      color: Colors.black,
                      fontsize: 18,
                      fontweight: FontWeight.w600),
                ),
                AppTextFormFiled(
                  keyboardtype: TextInputType.emailAddress,
                  text: "My voice is owsome",
                  fontweight: FontWeight.w400,
                  cntr: _controller.saveTextFieldController.value,
                ),
              ],
            ),
            Appbutton().primaryButton(
              context: context,
              title: "Save Recording",
              fontsize: 20,
              borderradius: 10,
              callback: () {
                _controller.copyFile(_controller.audioPath.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
