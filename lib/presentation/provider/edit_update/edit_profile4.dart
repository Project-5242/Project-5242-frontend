import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile1.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile3.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';

import '../../../data/constants/app_string.dart';

class EditProfile4 extends StatelessWidget {
  const EditProfile4({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
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

  _deskTopView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
              border: Border.all(
                  width: 1.0, color: AppColors.black1.withOpacity(0.25))),
          height: responsive.isTablet
              ? MediaQuery.of(context).size.height * 0.800
              : responsive.isDesktop
                  ? MediaQuery.of(context).size.height * 0.700
                  : MediaQuery.of(context).size.height * 0.600,
          width: responsive.isTablet
              ? MediaQuery.of(context).size.width * 0.700
              : MediaQuery.of(context).size.width * 0.500,
          child: Padding(
            padding: responsive.isTablet
                ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                : responsive.isDesktop
                    ? const EdgeInsets.symmetric(
                        horizontal: 70,
                      )
                    : const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Center(
                  child: Text(
                    AppStrings.createProfile,
                    style: context.customFont('Open Sans', 20.0,
                        FontWeight.w600, AppColors.themeColor),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                Image.asset(
                  AssetsRes.check,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.100,
                  height: MediaQuery.of(context).size.height * 0.100,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.053,
                ),
                Center(
                  child: Text(
                    AppStrings.profileUpdated,
                    style: context.customFont('Open Sans', 20.0,
                        FontWeight.w700, AppColors.themeColor),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
                CustomButton(
                  onTap: () {},
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.075,
                  text: AppStrings.done,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.040,
                ),
                CustomButton(
                  color: AppColors.white,
                  color1: AppColors.themeColor,
                  onTap: () {},
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.100,
                  text: AppStrings.preview,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
