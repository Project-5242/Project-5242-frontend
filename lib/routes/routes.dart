import 'package:flutter/material.dart';

class Routes {
  ///Create a GlobalKey<NavigatorState>
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String root = "/";
  static const String loginScreen = "/loginScreen";
  static const String chatscreen = "/chat";
  static const String registerScreen = "/registerScreen";
  static const String homeScreen = "/homeScreen";
  static const String errorScreen = "/errorScreen";
}
