import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';
import 'package:provider/provider.dart';

import '../../data/constants/app_string.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/custom_button.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final uniqueKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);

    return Consumer<SignUpProvider>(builder: (context, forgotValue, child) {
      return ChangePasswordScreen(
        midleWidget: Form(
          key: uniqueKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Dismiss keyboard
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isDesktop = constraints.maxWidth > 800;

                return ListView(
                  padding: responsive.isTablet
                      ? const EdgeInsets.symmetric(horizontal: 90)
                      : responsive.isDesktop
                          ? const EdgeInsets.symmetric(horizontal: 30)
                          : const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    if (isDesktop) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: _buildDesktopView(forgotValue),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.103,
                            ),
                            Image.asset(
                              AssetsRes.PASSWORD1,
                              fit: BoxFit.contain,
                              height:
                                  MediaQuery.of(context).size.height * 0.400,
                              width: MediaQuery.of(context).size.width * 0.300,
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      _buildMobileView(),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDesktopView(SignUpProvider forgotValue) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.430,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.forgetPassword,
            style: context.customFont(
                'Open Sans', 32.0, FontWeight.w700, AppColors.themeColor),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.101),
          Text(
            AppStrings.forgetPassword,
            style: context.customFont(
                'Open Sans', 20.0, FontWeight.w700, Colors.black),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.010),
          Text(
            AppStrings.enterEmailAddress1,
            style: context.customFont('Open Sans', 16.0, FontWeight.w400,
                AppColors.black.withOpacity(0.3)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.026),
          AppTextFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
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
            borderSideColor: AppColors.greyLight,
            hint: AppStrings.enterEmail,
            hintStyle: context.customFont(
                'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
            fillColor: AppColors.textFill,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.050),
          Center(
            child: CustomButton(
              onTap: () {
                if (uniqueKey.currentState!.validate()) {
                  forgotValue.callForgotPasswordApi(
                    context: context,
                    email: emailController.text.trim(),
                  );
                }
              },
              height: MediaQuery.of(context).size.height * 0.085,
              width: MediaQuery.of(context).size.width * 0.250,
              text: AppStrings.sendEmail,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileView() {
    return Consumer<SignUpProvider>(builder: (context, value, child) {
      return Column(
        children: [
          Image.asset(
            AssetsRes.PASSWORD1,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.150,
            width: MediaQuery.of(context).size.width * 0.150,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.024),
          Text(
            AppStrings.forgetPassword,
            textAlign: TextAlign.center,
            style: context.customFont(
                'Open Sans', 20.0, FontWeight.w700, Colors.black),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.010),
          Text(
            AppStrings.enterEmailAddress,
            textAlign: TextAlign.center,
            style: context.customFont('Open Sans', 16.0, FontWeight.w400,
                AppColors.black.withOpacity(0.3)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.026),
          AppTextFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.131),
          CustomButton(
            onTap: () {
              if (uniqueKey.currentState!.validate()) {
                value.callForgotPasswordApi(
                    context: context, email: emailController.text.trim());
              }
            },
            height: MediaQuery.of(context).size.height * 0.075,
            text: AppStrings.sendEmail,
          ),
        ],
      );
    });
  }
}
