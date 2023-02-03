import 'package:call_recording_app/module/Lock/Views/app_password_view.dart';
import 'package:call_recording_app/module/Setting/Components/app_password_card.dart';
import 'package:call_recording_app/module/Setting/Components/block_white_list.dart';
import 'package:call_recording_app/module/Setting/Components/record_calls_from.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
// import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingAudioSourceView extends StatefulWidget {
  SettingAudioSourceView({Key? key}) : super(key: key);

  @override
  State<SettingAudioSourceView> createState() => _SettingAudioSourceViewState();
}

class _SettingAudioSourceViewState extends State<SettingAudioSourceView> {
  bool enableCallsSwitchVal = true;
  bool outgoingCallsSwitchVal = true;

  bool incomingCallsSwitchVal = true;
  bool recordAllCallsRadio = true;

  //
  bool appPassword = false;

  @override
  Widget build(BuildContext context) {
    // print(recordAllCallsRadio);
    return Scaffold(
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "Settings",
        isBackButton: true,
        backOnPressed: () => Get.back(),
        isCenterTitle: true,
        textColor: AppColors.background,
        
      ),
      body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: AppConfig(context).width / 25),
          children: [
            const SizedBox(
              height: 15,
            ),
            RecordCallsFrom().card(
                context: context,
                enableCallRecord: enableCallsSwitchVal,
                incomingCall: incomingCallsSwitchVal,
                outgoingCalls: outgoingCallsSwitchVal,
                enableCallRecordSwitch: (e) {
                  setState(() {
                    if (e) {
                      enableCallsSwitchVal = e;
                      outgoingCallsSwitchVal = e;
                    } else {
                      enableCallsSwitchVal = e;
                      outgoingCallsSwitchVal = e;
                      incomingCallsSwitchVal = e;
                    }
                  });
                },
                incomingCallSwitch: (i) {
                  setState(() {
                    if (enableCallsSwitchVal && outgoingCallsSwitchVal) {
                      incomingCallsSwitchVal = i;
                    } else if (enableCallsSwitchVal) {
                      outgoingCallsSwitchVal = enableCallsSwitchVal;
                      incomingCallsSwitchVal = i;
                    }
                  });
                },
                outgoingCallsSwitch: (o) {
                  setState(() {
                    if (enableCallsSwitchVal && incomingCallsSwitchVal) {
                      outgoingCallsSwitchVal = o;
                    } else if (enableCallsSwitchVal) {
                      incomingCallsSwitchVal = enableCallsSwitchVal;
                      outgoingCallsSwitchVal = o;
                    }
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            BlockWhiteCallsForm().card(
                context: context,
                recordAllCalls: recordAllCallsRadio,
                onRadionChangeAllCalls: (v) {
                  setState(() {
                    recordAllCallsRadio = v;
                  });
                },
                onRadionChangeSelectedCalls: (v) {
                  setState(() {
                    recordAllCallsRadio = v;
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            AppPasswordCard().card(
                context: context,
                appPasswordSwitc: appPassword,
                changeAppPasswordPressed: () {
                  print("change password pressed");
                  if (appPassword) {
                    Get.to(() => AppPasswordView());
                  }
                },
                onAppPasswordSwitchChange: (v) {
                  setState(() {
                    appPassword = v;
                  });
                }),
          ]),
    );
  }
}
