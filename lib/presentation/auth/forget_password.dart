import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';

import '../../data/constants/app_string.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> uniqueKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return ChangePasswordScreen(
      midleWidget: Form(
        key: uniqueKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 800;
            return ListView(
              padding: responsive.isTablet
                  ? const EdgeInsets.symmetric(
                      horizontal: 90,
                    )
                  : responsive.isDesktop
                      ? const EdgeInsets.symmetric(
                          horizontal: 30,
                        )
                      : const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
              children: [
                if (isDesktop) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            //height: MediaQuery.of(context).size.height * 0.010,
                            width: MediaQuery.of(context).size.width * 0.430,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.forgetPassword,
                                  style: context.customFont('Open Sans', 32.0,
                                      FontWeight.w700, AppColors.themeColor),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.101,
                                ),
                                Text(
                                  AppStrings.forgetPassword,
                                  style: context.customFont('Open Sans', 20.0,
                                      FontWeight.w700, Colors.black),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                                Text(
                                  AppStrings.enterEmailAddress1,
                                  style: context.customFont(
                                    'Open Sans',
                                    16.0,
                                    FontWeight.w400,
                                    AppColors.black.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.026,
                                ),
                                AppTextFieldWidget(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                  title: AppStrings.email,
                                  borderSideColor:
                                      Color(0xff858585).withOpacity(0.3),
                                  hint: AppStrings.enterEmail,
                                  hintStyle: context.customFont('Open Sans',
                                      18.0, FontWeight.w400, AppColors.grey),
                                  fillColor: AppColors.textFill,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                ),
                                Center(
                                  child: CustomButton(
                                    onTap: () {
                                      if (uniqueKey.currentState!.validate()) {
                                        Navigator.pushNamed(
                                            context, Routes.otpScreen);
                                      }
                                    },
                                    height: MediaQuery.of(context).size.height *
                                        0.085,
                                    width: MediaQuery.of(context).size.width *
                                        0.250,
                                    text: AppStrings.sendEmail,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.103,
                        ),
                        Image.asset(
                          AssetsRes.PASSWORD1,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.400,
                          width: MediaQuery.of(context).size.width * 0.300,
                        )
                      ],
                    ),
                  ),
                ] else ...[
                  Image.asset(
                    AssetsRes.PASSWORD1,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.150,
                    width: MediaQuery.of(context).size.width * 0.150,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.024,
                  ),
                  Text(
                    AppStrings.forgetPassword,
                    textAlign: TextAlign.center,
                    style: context.customFont(
                        'Open Sans', 20.0, FontWeight.w700, Colors.black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  Text(
                    AppStrings.enterEmailAddress,
                    textAlign: TextAlign.center,
                    style: context.customFont(
                      'Open Sans',
                      16.0,
                      FontWeight.w400,
                      AppColors.black.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  AppTextFieldWidget(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    title: AppStrings.email,
                    borderSideColor: Color(0xff858585).withOpacity(0.3),
                    hint: AppStrings.enterEmail,
                    hintStyle: context.customFont(
                        'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
                    fillColor: AppColors.textFill,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.131,
                  ),
                  CustomButton(
                    onTap: () {
                      if (uniqueKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.otpScreen);
                      }
                    },
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width * 0.200,
                    text: AppStrings.sendEmail,
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
