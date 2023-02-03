import 'package:flutter/material.dart';

import '../../../Utills/App Theme/AppColors.dart';
import '../../../Utills/App Theme/app_config.dart';
import '../../../Utills/Customs/App Text/app_text.dart';

class FileDetailCard {
  fileDetails({
    required BuildContext context,
    String? fileName,
    fileLocation,
    fileSize,
  }) {
    return Card(
      elevation: 2,
      // color: AppColors.primaryAxcentColor().withOpacity(0.07),
      color: Colors.white,
      margin: EdgeInsets.all(AppConfig(context).width / 35),
      child: SizedBox(
        height: AppConfig(context).height / 3,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: Container(
              color: AppColors.primaryAxcentColor().withOpacity(0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppConfig(context).width / 3.5,
                    child: AppText.text("File name"),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    // color: Colors.red,
                    width: AppConfig(context).width * 0.6,
                    child: AppText.text(fileName,
                        fontsize: 20,
                        maxlines: 3,
                        color: AppColors.primaryTextColor().withOpacity(0.5),
                        textAlignment: TextAlign.left),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.primaryAxcentColor().withOpacity(0.16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppConfig(context).width / 3.5,
                    child: AppText.text("File size"),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    // color: Colors.red,
                    width: AppConfig(context).width * 0.6,
                    child: AppText.text(fileSize,
                        fontsize: 20,
                        maxlines: 3,
                        color: AppColors.primaryTextColor().withOpacity(0.5),
                        textAlignment: TextAlign.left),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.primaryAxcentColor().withOpacity(0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppConfig(context).width / 3.5,
                    child: AppText.text("File locarion"),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    // color: Colors.red,
                    width: AppConfig(context).width * 0.6,
                    child: AppText.text(fileLocation,
                        fontsize: 14,
                        maxlines: 3,
                        color: AppColors.primaryTextColor().withOpacity(0.5),
                        textAlignment: TextAlign.left),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
