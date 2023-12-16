import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internup/controllers/nav_bar_controller.dart';
import 'package:internup/core/routes.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key});

  final NavBarController bottomNavBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 2))),
        height: 64,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: GNav(
              tabs: pages.map((e) {
                return GButton(
                  icon: e["icon"] as IconData,
                  text: e["name"].toString(),
                );
              }).toList(),
              selectedIndex: bottomNavBarController.currentIndex.value,
              onTabChange: bottomNavBarController.currentIndex,
              rippleColor: Colors.transparent,
              tabBorderRadius: 10,
              gap: 5,
              iconSize: 24,
              tabActiveBorder: Border.all(color: Colors.black, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11.5),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textStyle: const TextStyle(fontSize: 14, fontFamily: 'FlamaMedium', letterSpacing: 1),
            )));
  }
}
