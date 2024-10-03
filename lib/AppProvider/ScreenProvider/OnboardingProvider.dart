import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/presentation/onboarding/select_role_screen.dart';

import '../../routes/routes.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    await sharedPrefs?.setBool(AppStrings.isSliderComplete, true);
    Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SelectRoleScreen()),
      (route) => false,
    );
    log("message=============11>${sharedPrefs?.getBool(AppStrings.isSliderComplete)}");
  }
}
