import 'package:call_recording_app/module/voice_recorder/model/voice_recorder_model.dart';
import 'package:get/get.dart';

class MyRecordingsListViewModel extends GetxController {
  RxInt numberOfRecordings = 0.obs;
  final listOfVoices = <MyRecordingRead>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    loadRecoringsFromData();
    super.onInit();
  }

  loadRecoringsFromData() async {
    final listdt = await MyRecordingsModel.fetchMyRecordings();
    for (var element in listdt) {
      listOfVoices.add(element);
    }
    numberOfRecordings.value = listOfVoices.length;
  }
}
