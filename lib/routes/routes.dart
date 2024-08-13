import 'package:flutter/material.dart';

class Routes {
  ///Create a GlobalKey<NavigatorState>
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String root = "/";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String verifyOtpScreen = "/verifyOtpScreen";
  static const String changePasswordScreen = "/changePasswordScreen";
  static const String mainScreen = "/mainScreen";
  static const String errorScreen = "/errorScreen";
}
