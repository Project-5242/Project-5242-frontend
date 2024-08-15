import 'package:flutter/material.dart';

class Routes {
  ///Create a GlobalKey<NavigatorState>
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String root = "/";
  static const String splashView = "/splashView";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String homeScreen = "/homeScreen";
  static const String errorScreen = "/errorScreen";
  static const String savedItemsScreen = "/savedItemsScreen";
  static const String userDetailScreen = "/userDetailScreen";
  static const String onboardingScreen = "/onboardingScreen";
  static const String selectRoleScreen = "/selectRoleScreen";
  static const String modeSelectionScreen = "/modeSelectionScreen";
  static const String profileView = "/profile_view";
  static const String editProfileView = "/edit_profile_view";
  static const String notificationView = "/notification_view";
  static const String settingView = "/setting_view";

  // Provider Side
  static const String selectCategoryView = "/select_category_view";
}
