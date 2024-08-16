import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';

import '../widgets/app_text_field_widget.dart';
import '../widgets/custom_button.dart';
import 'change_password.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return ChangePasswordScreen(
      midleWidget: Form(
        key: formKey,
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
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.417,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.changePassword,
                                  style: context.customFont('Open Sans', 32.0,
                                      FontWeight.w700, AppColors.themeColor),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.070,
                                ),
                                Text(
                                  AppStrings.createNewPassword,
                                  style: context.customFont(
                                    'Open Sans',
                                    20.0,
                                    FontWeight.w700,
                                    Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                                Text(
                                  AppStrings.newPasswordDifferent,
                                  style: context.customFont(
                                    'Open Sans',
                                    16.0,
                                    FontWeight.w400,
                                    AppColors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.020,
                                ),
                                AppTextFieldWidget(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters.';
                                    }
                                    return null;
                                  },
                                  password: _obscureText,
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(
                                      _obscureText
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      size: 24.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  title: AppStrings.newPassword,
                                  borderSideColor: AppColors.greyLight,
                                  hint: AppStrings.enterPassword,
                                  hintStyle: context.customFont(
                                    'Open Sans',
                                    18.0,
                                    FontWeight.w400,
                                    AppColors.grey,
                                  ),
                                  fillColor: AppColors.textFill,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.020,
                                ),
                                AppTextFieldWidget(
                                  controller: confirmPasswordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value !=
                                        passwordController.text) {
                                      return 'Confirm Password does not match with password';
                                    }
                                    return null;
                                  },
                                  password: _obscureConfirmText,
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmText =
                                            !_obscureConfirmText;
                                      });
                                    },
                                    icon: Icon(
                                      _obscureConfirmText
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye,
                                      size: 24.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  title: AppStrings.confirmPassword,
                                  borderSideColor: AppColors.greyLight,
                                  hint: AppStrings.enterPassword,
                                  hintStyle: context.customFont(
                                    'Open Sans',
                                    18.0,
                                    FontWeight.w400,
                                    AppColors.grey,
                                  ),
                                  fillColor: AppColors.textFill,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.040,
                                ),
                                CustomButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushNamed(
                                          context, Routes.homeScreen);
                                    }
                                  },
                                  height: MediaQuery.of(context).size.height *
                                      0.080,
                                  width:
                                      MediaQuery.of(context).size.width * 0.200,
                                  text: AppStrings.resetPassword,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.020,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80, right: 30),
                          child: Image.asset(
                            AssetsRes.PASSWORD3,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.400,
                            width: MediaQuery.of(context).size.width * 0.300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Image.asset(
                    AssetsRes.PASSWORD3,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.150,
                    width: MediaQuery.of(context).size.width * 0.150,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.044,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    AppStrings.createNewPassword,
                    style: context.customFont(
                      'Open Sans',
                      20.0,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    AppStrings.newPasswordDifferent,
                    style: context.customFont(
                      'Open Sans',
                      16.0,
                      FontWeight.w400,
                      AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  AppTextFieldWidget(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters.';
                      }
                      return null;
                    },
                    password: _obscureText,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    title: AppStrings.newPassword,
                    borderSideColor: AppColors.greyLight,
                    hint: AppStrings.enterPassword,
                    hintStyle: context.customFont(
                      'Open Sans',
                      18.0,
                      FontWeight.w400,
                      AppColors.grey,
                    ),
                    fillColor: AppColors.textFill,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  AppTextFieldWidget(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value != passwordController.text) {
                        return 'Confirm Password does not match with password';
                      }
                      return null;
                    },
                    password: _obscureConfirmText,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmText = !_obscureConfirmText;
                        });
                      },
                      icon: Icon(
                        _obscureConfirmText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        size: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    title: AppStrings.confirmPassword,
                    borderSideColor: AppColors.greyLight,
                    hint: AppStrings.enterPassword,
                    hintStyle: context.customFont(
                      'Open Sans',
                      18.0,
                      FontWeight.w400,
                      AppColors.grey,
                    ),
                    fillColor: AppColors.textFill,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.131,
                  ),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.homeScreen);
                      }
                    },
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width * 0.275,
                    text: AppStrings.resetPassword,
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
