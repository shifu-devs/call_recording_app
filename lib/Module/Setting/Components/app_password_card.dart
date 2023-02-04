import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppPasswordCard {
  card({
    required BuildContext context,
    bool appPasswordSwitc = false,
    Function? onAppPasswordSwitchChange,
    GestureTapCallback? changeAppPasswordPressed,
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
            "App password",
            textAlignment: TextAlign.left,
            color: AppColors.background,
            fontsize: 20,
            fontweight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppConfig(context).width / 20),
          height: AppConfig(context).height / 5.5,
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
                  AppText.text("Enable app lock", fontsize: 16),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    // color: Colors.red,
                    child: Switch(
                      activeColor: AppColors.primaryColor(),
                      // activeThumbImage: AppColors.background,
                      value: appPasswordSwitc,
                      onChanged: (value) {
                        onAppPasswordSwitchChange!(value);
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
                margin: EdgeInsets.only(
                  left: AppConfig(context).width / 12,
                ),
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: changeAppPasswordPressed,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.vpn_key_outlined,
                        color: AppColors.primaryAxcentColor(),
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText.text("Change password", fontsize: 15),
                      const Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        // color: Colors.red,
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
