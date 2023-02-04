
import 'package:audioplayers/audioplayers.dart';
import '/module/player/components/audio_player.dart';
import '/module/voice_recorder/view_model/voice_recording_view_model.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/customs/app_button/app_button.dart';
import '/utills/customs/app_text/app_text.dart';
import '/utills/customs/textfeilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        isBackButton: true,
        backOnPressed: () async {
          await _audioPlayer.stop();
          await _audioPlayer.dispose();
          Get.back();
        },
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
            callback: () async {
              // await Get.dialog(saveDialoge(context));
              // _controller.saveTextFieldController.value.text = "My Recording";
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: AppColors.transparent,
                    content: SaveDialogue()),
              );
              await _audioPlayer.stop();
              _controller.dispose();
              Get.back();
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

class SaveDialogue extends StatelessWidget {
  SaveDialogue({Key? key}) : super(key: key);
  final _controller = Get.find<VoiceRecordingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: AppConfig(context).height * 0.40,
        width: AppConfig(context).width * 0.90,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(15),
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
                  child: AppText.text("Enter Voice Title",
                      textAlignment: TextAlign.left,
                      color: Colors.black,
                      fontsize: 18,
                      fontweight: FontWeight.w600),
                ),
                AppTextFormFiled(
                  keyboardtype: TextInputType.emailAddress,
                  text: "My voice is owesome",
                  fontweight: FontWeight.w400,
                  cntr: _controller.saveTextFieldController.value,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.text(
                      "Is your favorite?",
                      fontsize: 18,
                      fontweight: FontWeight.w500,
                      color: AppColors.primaryColor(),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.isFavourite.value =
                            !_controller.isFavourite.value;
                      },
                      child: Icon(
                        _controller.isFavourite.value
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline,
                        size: 30,
                        color: AppColors.dark,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Appbutton().primaryButton(
              context: context,
              title: "Save Recording",
              fontsize: 20,
              borderradius: 10,
              callback: () async {
                // Get.back();
                try {
                  await _controller.copyFile(_controller.audioPath.value);
                  Get.back();
                } catch (e) {
                  print(">>>>>>>>>>>>>>> " +
                      e.toString() +
                      " <<<<<<<<<<<<<<<<<<<<<<<");
                }
                // Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
