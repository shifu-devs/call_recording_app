// import 'package:call_recording_app/Module/Player/Views/player_view.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../App Theme/AppColors.dart';
import '../App Theme/app_config.dart';
import '../Customs/App Text/app_text.dart';

class VoiceTile {
  allCallsTile(
          {required context,
          required String callerName,
          callDuration,
          callDateTime,
          bool isFav = false,
          bool isGoing = false,
          GestureTapCallback? onTapTile,
          GestureTapCallback? longPressed,
          Function? onTileSelect,
          bool isTileSelect = false,
          bool fromFilter = false,
          GestureTapCallback? clickFavIcon}) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppConfig(context).width / 30,
          vertical: 3,
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.primaryTextColor().withOpacity(0.05)),
            color: AppColors.primaryAxcentColor().withOpacity(0.08),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onTap: onTapTile,
          onLongPress: longPressed,
          horizontalTitleGap: 5,
          // minVerticalPadding: AppConfig(context).height / 30,
          focusColor: AppColors.primaryAxcentColor(),
          // shape: Border(
          //     bottom:
          //         BorderSide(color: AppColors.primaryAxcentColor(), width: 2)),
          title: Container(
            margin: EdgeInsets.only(bottom: AppConfig(context).height / 60),
            child: AppText.text(
              callerName,
              fontsize: 18,
              color: AppColors.primaryAxcentColor(),
              textAlignment: TextAlign.left,
            ),
          ),
          subtitle: AppText.text(
            callDateTime,
            fontsize: 12,
            textAlignment: TextAlign.left,
          ),
          trailing: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8, right: 8),
                  child: AppText.text(
                    callDuration,
                    fontsize: 12,
                  ),
                ),
                InkWell(
                  onTap: clickFavIcon,
                  child: fromFilter
                      ? Checkbox(
                          value: isTileSelect,
                          checkColor: AppColors.background,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            onTileSelect!(value);
                          },
                        )
                      : isFav
                          ? Icon(
                              Icons.star_rounded,
                              size: AppConfig(context).width / 15,
                              color: Colors.orange,
                            )
                          : Icon(
                              Icons.star_border_outlined,
                              size: AppConfig(context).width / 15,
                              color: Colors.black,
                            ),
                ),
              ]),
          leading: isGoing
              ? Icon(
                  Icons.call_received,
                  color: Colors.green,
                  size: AppConfig(context).width / 15,
                )
              : Icon(
                  Icons.call_made,
                  color: Colors.blue,
                  size: AppConfig(context).width / 15,
                ),
        ),
      );
}
