import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../widgets/app_rich_text.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responseive = ResponsiveCheck(context);
    return ChangePasswordScreen(
      midleWidget: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;
          return ListView(
            padding: responseive.isTablet
                ? const EdgeInsets.symmetric(
                    horizontal: 90,
                  )
                : responseive.isDesktop
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
                          width: MediaQuery.of(context).size.width * 0.500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.forgetPassword,
                                style: context.customFont('Open Sans', 32.0,
                                    FontWeight.w700, AppColors.themeColor),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.070,
                              ),
                              Text(
                                AppStrings.verifyOtp,
                                style: context.customFont('Open Sans', 20.0,
                                    FontWeight.w700, Colors.black),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.010,
                              ),
                              Text(
                                'Please enter 4 digit code sent to your e-mail :-',
                                style: context.customFont(
                                  'Open Sans',
                                  16.0,
                                  FontWeight.w400,
                                  AppColors.black,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.026,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.090,
                                width:
                                    MediaQuery.of(context).size.width * 0.250,
                                child: PinFieldAutoFill(
                                  keyboardType: TextInputType.number,
                                  decoration: BoxLooseDecoration(
                                    strokeColorBuilder:
                                        FixedColorBuilder(AppColors.themeColor),
                                    bgColorBuilder:
                                        FixedColorBuilder(AppColors.white),
                                    radius: const Radius.circular(5.0),
                                  ),
                                  codeLength: 4,
                                  onCodeChanged: (code) {
                                    if (code != null && code.length == 4) {
                                      print("OTP Code: $code");
                                    }
                                  },
                                  cursor: Cursor(
                                    width: 2,
                                    color: Colors.black,
                                    enabled: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.030,
                              ),
                              RichTextWidget(
                                  size: 14.0,
                                  decoration: TextDecoration.underline,
                                  color: AppColors.black,
                                  color1: AppColors.themeColor,
                                  text: AppStrings.dontReceiveCode,
                                  text1: AppStrings.resend,
                                  onTap: () {
                                    _dialogeBox(context);
                                  }),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.160,
                              ),
                              CustomButton(
                                onTap: () {
                                  //  if (uniqueKey.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, Routes.newPassword);
                                  //  }
                                },
                                height:
                                    MediaQuery.of(context).size.height * 0.085,
                                width:
                                    MediaQuery.of(context).size.width * 0.200,
                                text: AppStrings.verify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.103,
                      ),
                      Image.asset(
                        AssetsRes.PASSWORD2,
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.400,
                        width: MediaQuery.of(context).size.width * 0.300,
                      )
                    ],
                  ),
                ),
              ] else ...[
                Image.asset(
                  AssetsRes.PASSWORD2,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.150,
                  width: MediaQuery.of(context).size.width * 0.150,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.024,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.verifyOtp,
                  style: context.customFont(
                      'Open Sans', 20.0, FontWeight.w700, Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.enter4Digit,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width * 0.276,
                    child: PinFieldAutoFill(
                      keyboardType: TextInputType.number,
                      decoration: BoxLooseDecoration(
                        strokeColorBuilder:
                            FixedColorBuilder(AppColors.themeColor),
                        bgColorBuilder: FixedColorBuilder(AppColors.white),
                        radius: const Radius.circular(5.0),
                      ),
                      codeLength: 4,
                      onCodeChanged: (code) {
                        if (code != null && code.length == 4) {
                          print("OTP Code: $code");
                        }
                      },
                      cursor: Cursor(
                        width: 2,
                        color: Colors.black,
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.016,
                ),
                RichTextWidget(
                    size: 16,
                    decoration: TextDecoration.underline,
                    color: AppColors.black,
                    color1: AppColors.themeColor,
                    text: AppStrings.dontReceiveCode,
                    text1: AppStrings.resend,
                    onTap: () {
                      _dialogeBox(context);
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.131,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.homeScreen);
                  },
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width * 0.275,
                  text: AppStrings.verify,
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  void _dialogeBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.resendCode,
                  style: context.customFont(
                    'Open Sans',
                    20.0,
                    FontWeight.w700,
                    AppColors.themeColor,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.otpCodeSent,
                  style: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.black1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.032,
                ),
                CustomButton(
                  onTap: () => Navigator.pop(context),
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width * 0.275,
                  text: AppStrings.ok,
                ),
              ],
            ),
          ));
        });
  }
}
