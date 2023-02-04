
import '/module/call_recordings/view_model/call_recording_controller.dart';
import '/module/filters/views/filter_view.dart';
import '/module/player/views/player_view.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/drawer/app_drawer.dart';
import '/utills/voice_tile/voice_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  // print("val = ${i[index].isFav.obs.value}");
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
