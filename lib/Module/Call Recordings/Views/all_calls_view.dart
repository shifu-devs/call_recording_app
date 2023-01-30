import 'package:call_recording_app/Module/Call%20Recordings/View%20Model/call_recording_controller.dart';
import 'package:call_recording_app/Module/Filters/Views/filter_view.dart';
import 'package:call_recording_app/Utills/Customs/Drawer/app_drawer.dart';
import 'package:call_recording_app/Utills/Voice%20Tile/voice_tile.dart';
// import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
import 'package:delayed_display/delayed_display.dart';
// import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Player/Views/player_view.dart';

class AllCallsView extends StatelessWidget {
  String screenName;
  AllCallsView({this.screenName = "a", Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final _voiceController =
      Get.put<CallRecordingController>(CallRecordingController());

  int delayMul = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: AppDrawer().drawer(
        context: context,
        tilePressed: () => _key.currentState!.closeDrawer(),
      ),
      drawerEnableOpenDragGesture: true,
      appBar: CustomAppBar().simpleAppBar(
        context: context,
        title: "All Calls",
        textColor: Colors.white,
        isCenterTitle: true,
        isFilter: true,
        isDrawer: true,
        drawerButtonPressed: () {
          _key.currentState!.openDrawer();
        },
        filterPressed: (() {
          Get.to(() => FilterView(
                filterType: "home",
              ));
        }),
      ),
      body: Container(
        padding: EdgeInsets.only(top: AppConfig(context).height * 0.01),
        child: ListView.builder(
          itemCount: _voiceController.listOfVoices.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            var i = _voiceController.listOfVoices;
            // screenName=="a"
            return Obx(() => VoiceTile().allCallsTile(
                context: context,
                callerName: "$index->" + i[index].callerName,
                callDateTime: i[index].callDateTime,
                callDuration: i[index].callDuration,
                isFav: i[index].isFav,
                // isFav: _voiceController.myval.value,
                isGoing: i[index].isOutgoingCall,
                clickFavIcon: () {
                  // _voiceController.listOfVoices.remove(1).obs;
                  // _voiceController.listOfVoices
                  // _voiceController.listOfVoices[index].isFav =
                  //     !(i[index].isFav.obs.value);
                  // _voiceController.myval.value =
                  //     !(_voiceController.myval.value);
                  print("val = ${i[index].isFav.obs.value}");
                },
                onTapTile: () {
                  print("grt.to Play voice note");
                  Get.to(() => PlayerView());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PlayerView()));
                }));
          },
        ),
      ),
    );
  }
}
