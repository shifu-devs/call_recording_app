import 'package:get/get.dart';

class VoiceRecordingViewModel extends GetxController {
  RxBool isRecordingStarted = false.obs;
  RxBool isRecordingFirstTime = false.obs;
  RxString audioPath = "".obs;
}
