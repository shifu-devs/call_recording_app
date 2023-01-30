import 'package:call_recording_app/Module/Call%20Recordings/Views/all_calls_view.dart';
import 'package:call_recording_app/Module/Favourite/Views/favourite_view.dart';
import 'package:call_recording_app/Module/Voice%20Recordings/Views/voice_recoreder_view.dart';
import 'package:call_recording_app/Utills/App%20Theme/AppColors.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens(),
      items: navBarItems(),
      navBarStyle: NavBarStyle.style9,
      backgroundColor: AppColors.primaryColor().withOpacity(0.8),
      decoration: const NavBarDecoration(
          // colorBehindNavBar: Colors.pink,
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
    );
  }

  List<Widget> screens() {
    return [
      AllCallsView(),
      AllCallsView(),
      AllCallsView(),
      FavouriteView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "All",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color.fromARGB(255, 182, 179, 179),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.call_received_sharp),
        title: "Incomming",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color.fromARGB(255, 182, 179, 179),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.call_made_sharp),
        title: "Outgoing",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color.fromARGB(255, 182, 179, 179),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: "Favourite",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Color.fromARGB(255, 182, 179, 179),
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.mic),
      //   title: "Voice recorder",
      //   activeColorPrimary: Colors.white,
      //   inactiveColorPrimary: Color.fromARGB(255, 182, 179, 179),
      // ),
    ];
  }
}
