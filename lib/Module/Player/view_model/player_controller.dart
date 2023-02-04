import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class PlayerController extends GetxController {
  static Rx<AudioPlayer> audioPlayer = Rx(AudioPlayer());
}
