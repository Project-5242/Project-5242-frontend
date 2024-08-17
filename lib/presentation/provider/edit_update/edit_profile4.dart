import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';

import '../../../data/constants/app_string.dart';

class EditProfile4 extends StatelessWidget {
  const EditProfile4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.305,
            ),
            Image.asset(
              AssetsRes.check,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.053,
            ),
            Text(
              AppStrings.profileUpdated,
              style: context.customFont(
                  'Open Sans', 26.0, FontWeight.w700, AppColors.themeColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            CustomButton(
              onTap: () {},
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: AppStrings.done,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            CustomButton(
              color: AppColors.white,
              color1: AppColors.themeColor,
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfile3);
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: AppStrings.preview,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.148,
            ),
          ],
        ),
      ),
    ));
  }
}
