import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/presentation/home/BottomNavBarProvider.dart';
import 'package:flutter_project/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_project/presentation/onboarding/select_role_screen.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets_res.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      await startSplashScreenTimer();
    });
  }

  late Timer timer;
  Future<void> startSplashScreenTimer() async {
    timer = Timer(
      const Duration(seconds: 3),
      () async {
        final response = ResponsiveCheck(context);
        if (context.mounted) {
          if (sharedPrefs?.getBool(AppStrings.isLogin) == true) {
            if (sharedPrefs?.getBool(AppStrings.isProvider) == true) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarProvider(
                    whereComeTo: "provider",
                  ),
                ),
                (route) => false,
              );
            } else {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarProvider(),
                ),
                (route) => false,
              );
            }
          } else if (sharedPrefs?.getBool(AppStrings.isSliderComplete) ==
              true) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SelectRoleScreen(),
              ),
              (route) => false,
            );
          } else {
            response.isMobile
                ? Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                    (route) => false,
                  )
                : Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SelectRoleScreen(),
                    ),
                    (route) => false,
                  );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AssetsRes.WELCOME_LOTTIE, repeat: false),
      ),
    );
  }
}
