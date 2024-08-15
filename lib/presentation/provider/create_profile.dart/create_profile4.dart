import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile1.dart';
import 'package:flutter_project/res/assets_res.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';
import '../../home/home_view.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_button.dart';
import 'ctreate_profile3.dart';

class CreateProfile4 extends StatelessWidget {
  const CreateProfile4({super.key});

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
              AppStrings.profileCreated,
              style: context.customFont(
                  'Open Sans', 24.0, FontWeight.w700, AppColors.themeColor),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile1()));
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: AppStrings.editUpdate,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            CustomButton(
              color: AppColors.white,
              color1: AppColors.themeColor,
              onTap: () {},
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
