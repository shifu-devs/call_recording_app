import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter/material.dart';

class RecordCallsFrom {
  card({
    required BuildContext context,
    bool enableCallRecord = true,
    bool outgoingCalls = true,
    bool incomingCall = true,
    Function? enableCallRecordSwitch,
    Function? outgoingCallsSwitch,
    Function? incomingCallSwitch,
  }) {
    return Container(
        // color: AppColors.primaryColor(),
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: AppConfig(context).width,
          decoration: BoxDecoration(
              color: AppColors.primaryColor().withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: AppText.text(
            "Record calls from",
            textAlignment: TextAlign.left,
            color: AppColors.background,
            fontsize: 20,
            fontweight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppConfig(context).width / 20),
          height: AppConfig(context).height / 4,
          width: AppConfig(context).width,
          decoration: const BoxDecoration(
              color: AppColors.tileHighLisgtColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        // color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.mic,
                      color: AppColors.primaryColor(),
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AppText.text("Enable call recorder", fontsize: 16),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    // color: Colors.red,
                    child: Switch(
                      activeColor: AppColors.primaryColor(),
                      // activeThumbImage: AppColors.background,
                      value: enableCallRecord,
                      onChanged: (value) {
                        enableCallRecordSwitch!(value);
                      },
                    ),
                  ))
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.67, color: AppColors.dark),
                  ),
                ),
                margin: EdgeInsets.only(left: AppConfig(context).width / 12),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.call_made,
                      color: Colors.blue,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText.text("Outgoing calls", fontsize: 15),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Switch(
                        activeColor: AppColors.primaryColor(),
                        // activeThumbImage: AppColors.background,
                        value: outgoingCalls,
                        onChanged: (value) {
                          outgoingCallsSwitch!(value);
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.67, color: AppColors.dark),
                  ),
                ),
                margin: EdgeInsets.only(left: AppConfig(context).width / 12),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.call_received,
                      color: Colors.green,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText.text("Incoming calls", fontsize: 15),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Switch(
                        activeColor: AppColors.primaryColor(),
                        // activeThumbImage: AppColors.background,
                        value: incomingCall,
                        onChanged: (value) {
                          incomingCallSwitch!(value);
                        },
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
