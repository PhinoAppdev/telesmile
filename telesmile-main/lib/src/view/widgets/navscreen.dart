// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:telesmile/home.dart';

import 'about.dart';
import 'contactus.dart';
import 'gallery.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 0);
  final _screens = [
    HomePage(),
    AboutPage(),
    Gallery(),
    ContactUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        neumorphicProperties: NeumorphicProperties(showSubtitleText: true),
        navBarHeight: 55,
        controller: _persistentTabController,
        screens: _screens,
        items: _navBarItems(),
        confineInSafeArea: true,
        backgroundColor: Color(0xFFFCB117),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        // hideNavigationBar: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: false,
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        inactiveIcon: Icon(Icons.home_outlined),
        title: ('Home'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.group_rounded),
        inactiveIcon: Icon(Icons.group_outlined),
        title: ('About'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.photo),
        inactiveIcon: Icon(Icons.photo_outlined),
        title: ('Gallery'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.phone_rounded),
        inactiveIcon: Icon(Icons.phone_outlined),
        title: ('Contact Us'),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }
}
