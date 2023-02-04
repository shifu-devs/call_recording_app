import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class DrawerTile {
  tile(
      {required BuildContext context,
      required IconData icon,
      required String tileName,
      double iconSize = 25,
      double fontSize = 15,
     
      Widget? suffixWidget,
      GestureTapCallback? onPressed}) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 300),
      child: SizedBox(
        height: 45,
        child: ListTile(
          // tileColor: Colors.red,
          onTap: onPressed,
trailing: suffixWidget,
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
