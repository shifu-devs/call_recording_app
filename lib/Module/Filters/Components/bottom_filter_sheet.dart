import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
import 'package:flutter/material.dart';

import '../../../Utills/App Theme/app_config.dart';

// import '../../../../Utills/Theme/app_config.dart';

class BottomFilterSheet {
  filter(
      {required BuildContext context,
      required bool sortByDateTime,
      GestureTapCallback? sorByAtoZSortPressed,
      GestureTapCallback? sortByDateTimePressed}) {
    return showModalBottomSheet(
        context: context,
        // elevation: 1,
        // barrierColor: AppColors.dark.withOpacity(0.7),
        backgroundColor: AppColors.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppConfig(context).width / 15,
                vertical: AppConfig(context).width / 15),
            height: AppConfig(context).height / 3.7,
            // color: Colors.red,
            width: AppConfig(context).width,
            decoration: const BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.tune,
                      size: 25,
                      color: AppColors.primaryColor(),
                    ),
                    SizedBox(
                      width: AppConfig(context).width / 20,
                    ),
                    AppText.text("Filter By",
                        color: AppColors.primaryColor(),
                        fontsize: 15,
                        fontweight: FontWeight.w600),
                  ],
                ),
                SizedBox(
                  height: AppConfig(context).width / 12,
                ),
                InkWell(
                  onTap: sortByDateTimePressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 25,
                            color: sortByDateTime
                                ? AppColors.primaryColor()
                                : AppColors.dark.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: AppConfig(context).width / 20,
                          ),
                          AppText.text("Date and Time",
                              color: sortByDateTime
                                  ? AppColors.primaryColor()
                                  : AppColors.dark.withOpacity(0.4),
                              fontsize: 12,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      sortByDateTime
                          ? Icon(
                              Icons.check,
                              size: 25,
                              color: AppColors.primaryColor(),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConfig(context).width / 30.5,
                ),
                Container(
                  height: 1,
                  color: AppColors.dark.withOpacity(0.4),
                ),
                SizedBox(
                  height: AppConfig(context).height / 70.5,
                ),
                InkWell(
                  onTap: sorByAtoZSortPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sort_by_alpha_outlined,
                            size: 25,
                            color: sortByDateTime
                                ? AppColors.dark.withOpacity(0.4)
                                : AppColors.primaryColor(),
                          ),
                          SizedBox(
                            width: AppConfig(context).width / 20,
                          ),
                          AppText.text("A to Z",
                              color: sortByDateTime
                                  ? AppColors.dark.withOpacity(0.4)
                                  : AppColors.primaryColor(),
                              fontsize: 12,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                      !sortByDateTime
                          ? Icon(
                              Icons.check,
                              size: 25,
                              color: AppColors.primaryColor(),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
