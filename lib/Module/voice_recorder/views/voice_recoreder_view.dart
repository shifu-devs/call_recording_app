import '/module/my_recordings/views/my_recordings_view.dart';
import '/module/voice_recorder/components/my_voice_recorder.dart';
import '/module/voice_recorder/view_model/voice_recording_view_model.dart';
import '/module/voice_recorder/views/action_voice_recording_view.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

///// view /////
class VoiceRecorderView extends StatelessWidget {
  VoiceRecorderView({Key? key}) : super(key: key);
  final _controller = Get.put(VoiceRecordingViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.primaryColor().withOpacity(0.3),
          appBar: CustomAppBar().simpleAppBar(
              context: context,
              title: "Start Recording",
              isCenterTitle: true,
              textColor: AppColors.background,
              backOnPressed: () => Get.back(),
              isBackButton: true,),
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
                    await Get.to(() => ActionOnVoiceRocrding(),
                        arguments: path);

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
          bottomSheet: _controller.isRecordingStarted.value
              ? SizedBox()
              : InkWell(
                  onTap: () => Get.to(() => MyRecordingsView()),
                  child: Container(
                    height: AppConfig(context).height * 0.08,
                    width: AppConfig(context).width,
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(15),
                      //   topRight: Radius.circular(15),
                      // ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.text(
                          "View all recordings",
                          fontsize: 18,
                          fontweight: FontWeight.w600,
                          color: AppColors.primaryColor(),
                        ),
                        const Icon(
                          Icons.double_arrow_outlined,
                          color: AppColors.dark,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
