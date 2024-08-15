import 'package:flutter/material.dart';

class Routes {
  ///Create a GlobalKey<NavigatorState>
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String root = "/";
  static const String splashView = "/splashView";
  static const String loginScreen = "/loginScreen";
  static const String signUp = "/signUp";
  static const String forgetPassword = "/forgetPassword";
  static const String otpScreen = "/otpScrreen";
  static const String newPassword = "/newPassword";
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
  static const String createProfile = "/create_profile";
  static const String createProfile1 = "/create_profile1";
  static const String createProfile2 = "/create_profile2";
  static const String createProfile3 = "/create_profile3";
  static const String createProfile4 = "/create_profile4";

  static const String editProfile1 = "/edit_profile1";
  static const String editProfile2 = "/edit_profile2";
  static const String editProfile3 = "/edit_profile3";
  static const String editProfile4 = "/edit_profile4";
}
