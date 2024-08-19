import 'package:flutter/material.dart';

ThemeData getDarkTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFF0B8FAC),
    secondaryHeaderColor: const Color(0xffffffff),
    brightness: Brightness.dark,
    cardColor: const Color(0xFF252525),
    hintColor: const Color(0xFFbebebe),
    primaryColorDark: const Color(0xFFFFFFFF),
    disabledColor: const Color(0x33FF9A62),
    shadowColor: Colors.black.withOpacity(0.4),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0B8FAC))),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),
  );
}
