import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
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
    return ChangePasswordScreen(
      midleWidget: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              if (isDesktop) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.101,
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
                                AppStrings.enter4digitSentEmail,
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.090,
                                  width:
                                      MediaQuery.of(context).size.width * 0.250,
                                  child: PinFieldAutoFill(
                                    keyboardType: TextInputType.number,
                                    decoration: BoxLooseDecoration(
                                      strokeColorBuilder: FixedColorBuilder(
                                          AppColors.themeColor),
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
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.030,
                              ),
                              Center(
                                child: RichTextWidget(
                                    size: 16,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.black,
                                    color1: AppColors.themeColor,
                                    text: AppStrings.dontReceiveCode,
                                    text1: AppStrings.resend,
                                    onTap: () {
                                      _dialogeBox(context);
                                    }),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.050,
                              ),
                              Center(
                                child: CustomButton(
                                  onTap: () {
                                    //  if (uniqueKey.currentState!.validate()) {
                                    Navigator.pushNamed(
                                        context, Routes.newPassword);
                                    //  }
                                  },
                                  height: MediaQuery.of(context).size.height *
                                      0.085,
                                  width:
                                      MediaQuery.of(context).size.width * 0.250,
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
              content: LayoutBuilder(builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 800;
            return Container(
              height: isDesktop
                  ? MediaQuery.of(context).size.height * 0.300
                  : MediaQuery.of(context).size.height * 0.18,
              width: isDesktop
                  ? MediaQuery.of(context).size.width * 400
                  : MediaQuery.of(context).size.width,
              child: Column(
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
            );
          }));
        });
  }
}
