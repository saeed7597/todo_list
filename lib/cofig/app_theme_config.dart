import 'dart:ui';

import 'package:flutter/material.dart';

class AppThemeConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final Color surfaceColor;
  Brightness brightness;
  Color backgroundColor;
  AppThemeConfig.light()
      : primaryColor = const Color(0xff242F9B),
        secondaryColor = const Color(0xff646FD4),
        surfaceColor = const Color(0xff9BA3EB),
        brightness = Brightness.light,
        backgroundColor = Colors.white;

  AppThemeConfig.dark()
      : primaryColor = const Color(0xff242F9B),
        secondaryColor = const Color(0xff646FD4),
        surfaceColor = const Color(0xff9BA3EB),
        brightness = Brightness.dark,
        backgroundColor = Colors.black;

  ThemeData getTheme() {
    return ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        brightness: brightness,
        scaffoldBackgroundColor: backgroundColor,
        secondaryHeaderColor: secondaryColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: surfaceColor
          ),
          bodyText2: TextStyle(
            color: secondaryColor
          ),
          headline6: TextStyle(
            color: secondaryColor
          )
        )
    );
  }
}