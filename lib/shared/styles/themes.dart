import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color.dart';

// Default Theme For Application
ThemeData occasionLightTheme = ThemeData(
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white
  ),
  tabBarTheme:  TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: defaultColor,
            width: 2.5,
          )),
      unselectedLabelColor: Colors.black,
      labelColor: defaultColor,
      labelPadding: const EdgeInsets.only(left: 5, right: 8),
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.1),
    unselectedLabelStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.1),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    selectedIconTheme: IconThemeData(
      size: 28,
      color: defaultColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey.shade600,
    ),
    backgroundColor: Colors.white,
    elevation: 5.0,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light)),
);