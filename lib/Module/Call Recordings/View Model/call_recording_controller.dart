import 'package:get/get.dart';

class CallRecordingController extends GetxController {
  final listOfVoices = <Voices>[].obs;
  // final Rxn<Voices> voiceData = Rxn<Voices>();
  

  final myval = false.obs;
  @override
  void onInit() {
    for (int i = 0; i < 20; i++) {
      listOfVoices.add(Voices(
        callDateTime: DateTime.now().toString(),
        callDuration: DateTime.now().hour.toString() +
            ":" +
            DateTime.now().minute.toString(),
        callerName: "Uzair Chattha",
        isFav: i % 2 == 0 ? false : true,
        isOutgoingCall: i % 2 == 0 ? false : true,
      ));
    }
    super.onInit();
  }
}

class Voices {
  String callerName;
  String callDateTime;
  String callDuration;
  bool isFav;
  bool isOutgoingCall;
  Voices({
    required this.callDateTime,
    required this.callDuration,
    required this.callerName,
    required this.isFav,
    required this.isOutgoingCall,
  });
}
