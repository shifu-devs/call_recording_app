import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../App Theme/AppColors.dart';
import '../../../App Theme/app_config.dart';
import '../../App Text/app_text.dart';

class DrawerTile {
  tile(
      {required BuildContext context,
      required IconData icon,
      required String tileName,
      double iconSize = 25,
      double fontSize = 15,
      GestureTapCallback? onPressed}) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: SizedBox(
        height: 45,
        child: ListTile(
          // tileColor: Colors.red,
          onTap: onPressed,

          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: AppColors.dark.withOpacity(0.7),
              ),
              SizedBox(
                width: AppConfig(context).width / 15,
              ),
              AppText.text(
                tileName,
                color: AppColors.dark,
                fontsize: fontSize,
                fontweight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
