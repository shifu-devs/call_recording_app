import 'package:call_recording_app/Utills/Voice%20Tile/voice_tile.dart';
// import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';
import 'package:call_recording_app/Utills/App%20Theme/app_config.dart';
import 'package:call_recording_app/Utills/Customs/App%20Bar/my_app_bar.dart';
// import 'package:call_recording_app/Utills/Customs/App%20Text/app_text.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utills/Customs/Drawer/app_drawer.dart';
import '../../Filters/Views/filter_view.dart';
import '../../Player/Views/player_view.dart';

class Voices {
  String callerName;
  String callDateTime;
  String callDuration;
  bool isFav;
  bool isOutgoingCall;
  Voices(
      {required this.callDateTime,
      required this.callDuration,
      required this.callerName,
      required this.isFav,
      required this.isOutgoingCall});
}

class FavouriteView extends StatefulWidget {
  FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  List<Voices> listOfVoices = [
    Voices(
      callDateTime: DateTime.now().toString(),
      callDuration: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      callerName: "Jabran Haider",
      isFav: true,
      isOutgoingCall: true,
    ),
    Voices(
      callDateTime: DateTime.now().toString(),
      callDuration: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      callerName: "Jabran Haider",
      isFav: true,
      isOutgoingCall: false,
    ),
    Voices(
      callDateTime: DateTime.now().toString(),
      callDuration: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      callerName: "Jabran Haider",
      isFav: true,
      isOutgoingCall: true,
    ),
    Voices(
      callDateTime: DateTime.now().toString(),
      callDuration: DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      callerName: "Jabran Haider",
      isFav: true,
      isOutgoingCall: false,
    )
  ];
  final GlobalKey<ScaffoldState> _keys = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _keys,
        drawer: AppDrawer().drawer(
          context: context,
          tilePressed: () => _keys.currentState!.closeDrawer(),
        ),
        drawerEnableOpenDragGesture: true,
        appBar: CustomAppBar().simpleAppBar(
          context: context,
          title: "Favourite",
          textColor: Colors.white,
          isCenterTitle: true,
          isFilter: true,
          isDrawer: true,
          drawerButtonPressed: () {
            _keys.currentState!.openDrawer();
          },
          filterPressed: (() {
            Get.to(() => FilterView(
                  filterType: "fav",
                ));
          }),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: AppConfig(context).height * 0.01,
            ),
            for (var i in listOfVoices)
              VoiceTile().allCallsTile(
                  context: context,
                  callerName: i.callerName,
                  callDateTime: i.callDateTime,
                  callDuration: i.callDuration,
                  isFav: i.isFav,
                  isGoing: i.isOutgoingCall,
                  clickFavIcon: () {
                    setState(() {
                      // i.isFav = !i.isFav;
                      listOfVoices.remove(i);
                    });
                  },
                  longPressed: () {
                    print("long presses");
                  },
                  onTapTile: () {
                    print("grt.to Play voice note");
                    Get.to(() => PlayerView());
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PlayerView()));
                  }),
          ],
        ));
  }
}
