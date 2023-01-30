import 'package:flutter/material.dart';

import '../../../Utills/App Theme/AppColors.dart';
import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Text/app_text.dart';

class BlockWhiteCallsForm {
  card({
    required BuildContext context,
    bool recordAllCalls = true,
    // bool recordSome = true,
    // bool incomingCall = true,
    // Function? enableCallRecordSwitch,
    // Function? outgoingCallsSwitch,
    required Function onRadionChangeAllCalls,
    required Function onRadionChangeSelectedCalls,
  }) {
    return Column(
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
            "Black list & White list",
            textAlignment: TextAlign.left,
            color: AppColors.background,
            fontsize: 20,
            fontweight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppConfig(context).width / 20),
          height: AppConfig(context).height / 4.5,
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
                  AppText.text("Record all calls", fontsize: 16),
                  // Expanded(
                  //     child: Align(
                  //   alignment: Alignment.centerRight,
                  //   // color: Colors.red,
                  //   child: Switch(
                  //     activeColor: AppColors.primaryColor(),
                  //     // activeThumbImage: AppColors.background,
                  //     value: enableCallRecord,
                  //     onChanged: (value) {
                  //       enableCallRecordSwitch!(value);
                  //     },
                  //   ),
                  // ))
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
                    Icon(
                      Icons.keyboard_voice_outlined,
                      color: AppColors.primaryColor(),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText.text("Record all calls", fontsize: 15),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerRight,
                        // color: Colors.red,
                        child: Radio<bool>(
                          value: true,
                          groupValue: recordAllCalls,
                          activeColor: AppColors.primaryAxcentColor(),
                          onChanged: (value) {
                            onRadionChangeSelectedCalls(value);
                          },
                        ),
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
                    Icon(
                      Icons.contact_phone_outlined,
                      color: AppColors.primaryAxcentColor(),
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText.text("Only selected", fontsize: 15),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Radio<bool>(
                        value: false,
                        groupValue: recordAllCalls,
                        activeColor: AppColors.primaryAxcentColor(),
                        onChanged: (value) {
                          onRadionChangeSelectedCalls(value);
                        },
                      ),
                      // Switch(
                      //   activeColor: AppColors.primaryColor(),
                      //   // activeThumbImage: AppColors.background,
                      //   value: incomingCall,
                      //   onChanged: (value) {
                      //     incomingCallSwitch!(value);
                      //   },
                      // ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
