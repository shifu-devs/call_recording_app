import 'dart:async';

import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class MyVoiceRecorder extends StatefulWidget {
  final void Function(String path) onStop;
  Function onStartPressed;

  MyVoiceRecorder(
      {Key? key, required this.onStop, required this.onStartPressed})
      : super(key: key);

  @override
  State<MyVoiceRecorder> createState() => _MyVoiceRecorderState();
}

class _MyVoiceRecorderState extends State<MyVoiceRecorder> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  Amplitude? _amplitude;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    _amplitudeSub = _audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) => setState(() => _amplitude = amp));

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        widget.onStartPressed();
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();
        // final isRecording = await _audioRecorder.isRecording();

        await _audioRecorder.start();
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);
    }
  }

  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildRecordStopControl(),
              const SizedBox(width: 20),
              _buildPauseResumeControl(),
            ],
          ),
          const SizedBox(height: 30),
          _buildText(),
          if (_amplitude != null) ...[
            const SizedBox(height: 40),
            Container(
              width: AppConfig(context).width * 0.80,
              // margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text(
                    'Current: ${_amplitude?.current ?? 0.0}',
                    textAlignment: TextAlign.start,
                    color: AppColors.darkPrimaryColor,
                  ),
                  AppText.text(
                    'Max: ${_amplitude?.max ?? 0.0}',
                    color: AppColors.darkPrimaryColor,
                    textAlignment: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = const Icon(Icons.stop, color: Colors.red, size: 45);
      color = Colors.white.withOpacity(0.8);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: AppColors.background, size: 45);
      color = AppColors.background.withOpacity(0.3);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 100, height: 100, child: icon),
          onTap: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (_recordState == RecordState.record) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 45);
      color = Colors.white.withOpacity(0.8);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Colors.red, size: 45);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 100, height: 100, child: icon),
          onTap: () {
            (_recordState == RecordState.pause) ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }

    return AppText.text(
      "Tap to start recording",
      fontsize: 20,
      fontweight: FontWeight.w400,
      color: AppColors.background,
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return SizedBox(
      width: 100,
      child: AppText.text(
        '$minutes : $seconds',
        fontsize: 30,
        maxlines: 2,
        textAlignment: TextAlign.start,
        fontweight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
