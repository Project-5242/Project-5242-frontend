import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/navigation_extension.dart';
import 'package:flutter_project/routes/routes.dart';
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
    Future.delayed(const Duration(seconds: 03), () {
      if (context.mounted) context.pushNamedAndRemoveUntil(Routes.dashbaord);
    });
    super.initState();
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
