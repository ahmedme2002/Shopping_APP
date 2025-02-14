import 'package:flutter/material.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';

final themeLight = ThemeData.light().copyWith(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: AllColors.white,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AllColors.black,
    unselectedItemColor: AllColors.black26,
    selectedIconTheme: IconThemeData(size: 20),
    unselectedIconTheme: IconThemeData(size: 20),
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    enableFeedback: false,
  ),
);

final themeDark = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: AllColors.black,
  splashColor: AllColors.blue,
  colorScheme: const ColorScheme.light(
      surface: AllColors.white,
      secondary: AllColors.blue,
      primary: AllColors.blue),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AllColors.blue,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: AllColors.black),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AllColors.black,
  appBarTheme: AppBarTheme(
      backgroundColor: AllColors.black,
      foregroundColor: AllColors.white,
      surfaceTintColor: AllColors.white,
      titleTextStyle: cm20.copyWith(color: Colors.white),
      elevation: 0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: AllColors.black,
    backgroundColor: AllColors.white,
  ),
  hintColor: AllColors.grey,
  iconTheme: const IconThemeData(color: AllColors.white),
);
