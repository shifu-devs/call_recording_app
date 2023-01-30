import 'package:audioplayers/audioplayers.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:flutter/material.dart';

class MyAudioPlayer extends StatefulWidget {
  String sourcePath;
  MyAudioPlayer({this.sourcePath = "", Key? key}) : super(key: key);

  @override
  State<MyAudioPlayer> createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  final _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   playerDispose();

  //   duration = Duration.zero;
  //   position = Duration.zero;

  //   super.dispose();
  // }

  @override
  void initState() {
    // _audioPlayer.setReleaseMode(ReleaseMode.release);
    setAudio();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
      _audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });
      _audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    });

    super.initState();
  }

  Future setAudio() async {
    // String url = "https://foo.com/bar.mp3";
    if (widget.sourcePath == "") {
      await _audioPlayer.play(AssetSource("song1.mp3"));
    } else {
      await _audioPlayer.play(DeviceFileSource(widget.sourcePath));
    }

    // _audioPlayer.play()
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        try {
          _audioPlayer.stop();
          _audioPlayer.dispose();
        } catch (e) {
          print(">>>>>>>>>>>" + e.toString() + "<<<<<<<<");
        }
        return true;
      },
      child: Card(
        color: const Color(0xffEDF6F4),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              activeColor: AppColors.primaryAxcentColor(),
              secondaryActiveColor: AppColors.primaryAxcentColor(),
              thumbColor: AppColors.primaryAxcentColor(),
              inactiveColor: AppColors.primaryTextColor().withOpacity(0.2),
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final pPositon = Duration(seconds: value.toInt());
                await _audioPlayer.seek(pPositon);
                await _audioPlayer.resume();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConfig(context).width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.text(
                    formatTime(position),
                  ),
                  AppText.text(
                    formatTime(duration),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor(),
                  radius: 25,
                  child: IconButton(
                    color: AppColors.background,
                    icon: const Icon(
                      Icons.fast_rewind,
                      size: 25,
                    ),
                    onPressed: () async {
                      if (position - Duration(seconds: 10) > Duration.zero) {
                        await _audioPlayer
                            .seek(position - const Duration(seconds: 10));
                      } else {
                        await _audioPlayer.seek(Duration.zero);
                      }
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor(),
                  radius: 35,
                  child: IconButton(
                    color: AppColors.background,
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                    ),
                    onPressed: () async {
                      if (position.inSeconds != duration.inSeconds) {
                        if (isPlaying) {
                          await _audioPlayer.pause();
                        } else {
                          // await _audioPlayer.play(position: position,);
                          await _audioPlayer.resume();
                        }
                        // print(position);
                        // print(duration);
                      } else {
                        print("Position = duration");
                        position = Duration.zero;
                        _audioPlayer.seek(position);
                        await setAudio();
                        _audioPlayer.resume();
                      }
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor(),
                  radius: 25,
                  child: IconButton(
                    color: AppColors.background,
                    icon: const Icon(
                      Icons.fast_forward,
                      size: 25,
                    ),
                    onPressed: () async {
                      if (position + Duration(seconds: 10) < duration) {
                        await _audioPlayer
                            .seek(position + const Duration(seconds: 10));
                      } else {
                        await _audioPlayer.seek(Duration.zero);
                        await _audioPlayer.pause();
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  String formatTime(Duration dur) {
    String ih = "${dur.inHours}";
    String im = "${dur.inMinutes.remainder(60)}";
    String iS = "${(dur.inSeconds.remainder(60))}";

    String h = ih.length == 2 ? "${dur.inHours} : " : "0${dur.inHours} : ";
    String m = im.length == 2
        ? "${dur.inMinutes.remainder(60)} : "
        : "0${dur.inMinutes.remainder(60)} : ";
    String s = iS.length == 2
        ? "${dur.inSeconds.remainder(60)} "
        : "0${dur.inSeconds.remainder(60)} ";
    if (ih == "0") {
      h = "";
    }

    String sDuration = "$h$m$s";

    return sDuration;
  }
}
