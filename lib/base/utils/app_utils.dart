import 'dart:developer';
import 'package:flutter_project/base/base.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/routes.dart';
import '../helpers/db_helper.dart';

class AppUtils {
  /// Launch Url's
  static void goToUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  /// Hide the soft keyboard.
  static void hideKeyboard(BuildContext? context) {
    if (context != null) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  /// Greetings
  static String getGreeting() {
    DateTime currentTime = DateTime.now();
    int hour = currentTime.hour;

    if (hour >= 5 && hour < 12) {
      return "Good morning!";
    } else if (hour >= 12 && hour < 17) {
      return "Good afternoon!";
    } else {
      return "Good evening!";
    }
  }

  /// Start First Screen
  static void startFirstScreen({String? message}) {
    DbHelper.eraseData();
    Routes.navigatorKey.currentContext?.pushNamed(Routes.root);
    showToast(message: message);
  }

  /// Show Toast
  static showToast({required String? message, bool error = false}) {
    if (message == null) {
      return;
    }
    log("Toast message => $message");
    toastification.show(
      description: Text(message),
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.notifications),
      style: ToastificationStyle.minimal,
      type: error ? ToastificationType.error : ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 2),
    );
  }

  /// Font Size Handling
  static double getAdaptiveFontSize(BuildContext context, double size) {
    if (kIsWeb || MediaQuery.of(context).size.width >= 600) {
      // Tablet and Web scaling
      return size * 1.2;
    } else {
      // Mobile scaling
      return size;
    }
  }
}
