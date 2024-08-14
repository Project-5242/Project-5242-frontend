import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';

ThemeData getLightTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFF0B8FAC),
    secondaryHeaderColor: const Color(0xffffffff),
    brightness: Brightness.light,
    cardColor: const Color(0xFFEFEEEE),
    hintColor: const Color(0xFFbebebe),
    scaffoldBackgroundColor: AppColors.white,
    primaryColorDark: const Color(0xFF020101),
    disabledColor: const Color(0x33FF9A62),
    shadowColor: Colors.black.withOpacity(0.4),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            color: Color(0xFF0B8FAC))),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),
  );
}
