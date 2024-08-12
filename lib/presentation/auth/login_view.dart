import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.welcome,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Text(
            AppStrings.signIn,
            style: context.displaySmall.copyWith(fontWeight: FontWeight.bold),
          ),
          Gap(10),
          Text(
            AppStrings.loginSubTitle,
            style: context.labelLarge,
          )
        ],
      ),
    );
  }
}
