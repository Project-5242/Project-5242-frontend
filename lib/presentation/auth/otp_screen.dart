import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../data/constants/app_string.dart';
import '../widgets/app_rich_text.dart';
import '../widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  final String? whereComeTo;
  final String? roleType;
  final String? email;

  OtpScreen({super.key, this.roleType, this.whereComeTo, this.email});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responseive = ResponsiveCheck(context);
    return Consumer<SignUpProvider>(builder: (context, otpValue, child) {
      return LayoutBuilder(builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        return ChangePasswordScreen(
          appBar: AppBar(
            leading: isDesktop
                ? null
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 21.0,
                      color: Colors.black,
                    )),
            title: isDesktop
                ? null
                : widget.whereComeTo == "signup"
                    ? const Text(
                        AppStrings.emailVerify,
                      )
                    : const Text(
                        AppStrings.changePassword,
                      ),
            automaticallyImplyLeading: isDesktop ? false : true,
            centerTitle: isDesktop ? false : true,
          ),
          midleWidget: LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 800;
              return ListView(
                padding: responseive.isTablet
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : responseive.isDesktop
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
                            child: SizedBox(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                  ),
                                  Text(
                                    AppStrings.verifyOtp,
                                    style: context.customFont('Open Sans', 20.0,
                                        FontWeight.w700, Colors.black),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.010,
                                  ),
                                  Text(
                                    'Please enter 4 digit code sent to your e-mail :-',
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
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.090,
                                    width: MediaQuery.of(context).size.width *
                                        0.250,
                                    child: PinCodeTextField(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                      length: 4,
                                      obscureText: false,
                                      controller: otpController,
                                      animationType: AnimationType.fade,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter OTP';
                                        }
                                        return null;
                                      },
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(12),
                                        fieldHeight: 40,
                                        fieldWidth: 40,
                                        borderWidth: 1,
                                        activeBorderWidth: 1,
                                        disabledBorderWidth: 1,
                                        errorBorderWidth: 1,
                                        inactiveBorderWidth: 1,
                                        selectedBorderWidth: 1,
                                        errorBorderColor: AppColors.red,
                                        activeFillColor: AppColors.white,
                                        activeColor: AppColors.grey,
                                        selectedColor: AppColors.grey,
                                        disabledColor: AppColors.grey,
                                        inactiveColor: AppColors.grey,
                                        inactiveFillColor: AppColors.white,
                                        selectedFillColor: AppColors.white,
                                      ),
                                      keyboardType: TextInputType.number,
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      backgroundColor: Colors.transparent,
                                      cursorColor: AppColors.blue,
                                      enableActiveFill: true,
                                      onCompleted: (v) {
                                        // Check if OTP field is empty or less than required digits
                                        if (otpController.text.isEmpty ||
                                            otpController.text.length < 4) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Please Enter an OTP')),
                                          );
                                        } else {
                                          if (widget.whereComeTo == "signup") {
                                            otpValue.verifyOtpApi(
                                                context: context,
                                                email: widget.email.toString(),
                                                otp: otpController.text.trim());
                                          } else {
                                            otpValue.callForgotVerifyOtpApi(
                                                context: context,
                                                email: widget.email.toString(),
                                                otp: otpController.text.trim());
                                          }
                                        }
                                      },
                                      onChanged: (value) {},
                                      beforeTextPaste: (text) {
                                        log("Allowing to paste $text");
                                        return true;
                                      },
                                      appContext: context,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.030,
                                  ),
                                  RichTextWidget(
                                      size: 14.0,
                                      decoration: TextDecoration.underline,
                                      color: AppColors.black.withOpacity(0.3),
                                      color1: AppColors.themeColor,
                                      text: AppStrings.dontReceiveCode,
                                      text1: AppStrings.resend,
                                      onTap: () {
                                        dialogeBox(
                                            context: context,
                                            onPressed: () {
                                              otpValue
                                                  .callResendOtpApi(
                                                      context: context,
                                                      email: widget.email ?? "")
                                                  .then((v) {
                                                Navigator.of(context).pop();
                                              });
                                            });
                                      }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.160,
                                  ),
                                  CustomButton(
                                    onTap: () {
                                      // Check if OTP field is empty or less than required digits
                                      if (otpController.text.isEmpty ||
                                          otpController.text.length < 4) {
                                        // Show a message to the user
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Please Enter an OTP')),
                                        );
                                      } else {
                                        // Proceed with the API call
                                        if (widget.whereComeTo == "signup") {
                                          otpValue.verifyOtpApi(
                                              context: context,
                                              email: widget.email.toString(),
                                              otp: otpController.text
                                                  .toString());
                                        } else {
                                          otpValue.callForgotVerifyOtpApi(
                                              context: context,
                                              email: widget.email.toString(),
                                              otp: otpController.text
                                                  .toString());
                                        }
                                      }
                                    },
                                    height: MediaQuery.of(context).size.height *
                                        0.060,
                                    width: MediaQuery.of(context).size.width *
                                        0.275,
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
                        AppColors.black.withOpacity(0.3),
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
                        child: PinCodeTextField(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          length: 4,
                          obscureText: false,
                          controller: otpController,
                          animationType: AnimationType.fade,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter OTP';
                            }
                            return null;
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12),
                            fieldHeight: 40,
                            fieldWidth: 40,
                            borderWidth: 1,
                            activeBorderWidth: 1,
                            disabledBorderWidth: 1,
                            errorBorderWidth: 1,
                            inactiveBorderWidth: 1,
                            selectedBorderWidth: 1,
                            errorBorderColor: AppColors.red,
                            activeFillColor: AppColors.white,
                            activeColor: AppColors.grey,
                            selectedColor: AppColors.grey,
                            disabledColor: AppColors.grey,
                            inactiveColor: AppColors.grey,
                            inactiveFillColor: AppColors.white,
                            selectedFillColor: AppColors.white,
                          ),
                          keyboardType: TextInputType.number,
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          cursorColor: AppColors.blue,
                          enableActiveFill: true,
                          onCompleted: (v) {
                            // Check if OTP field is empty or less than required digits
                            if (otpController.text.isEmpty ||
                                otpController.text.length < 4) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please Enter an OTP')),
                              );
                            } else {
                              // Proceed with the API call
                              if (widget.whereComeTo == "signup") {
                                otpValue.verifyOtpApi(
                                    context: context,
                                    email: widget.email.toString(),
                                    otp: otpController.text.trim());
                              } else {
                                otpValue.callForgotVerifyOtpApi(
                                    context: context,
                                    email: widget.email.toString(),
                                    otp: otpController.text.trim());
                              }
                            }
                          },
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            log("Allowing to paste $text");
                            return true;
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.016,
                    ),
                    RichTextWidget(
                        size: 16,
                        decoration: TextDecoration.underline,
                        color: AppColors.black.withOpacity(0.3),
                        color1: AppColors.themeColor,
                        text: AppStrings.dontReceiveCode,
                        text1: AppStrings.resend,
                        onTap: () {
                          dialogeBox(
                            context: context,
                            onPressed: () {
                              otpValue.callResendOtpApi(
                                  context: context, email: widget.email ?? "");
                              Navigator.of(context).pop();
                            },
                          );
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.131,
                    ),
                    CustomButton(
                      onTap: () {
                        // Check if OTP field is empty or less than required digits
                        if (otpController.text.isEmpty ||
                            otpController.text.length < 4) {
                          // Show a message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please Enter an OTP')),
                          );
                        } else {
                          // Proceed with the API call
                          if (widget.whereComeTo == "signup") {
                            otpValue.verifyOtpApi(
                                context: context,
                                email: widget.email.toString(),
                                otp: otpController.text.toString());
                          } else {
                            otpValue.callForgotVerifyOtpApi(
                                context: context,
                                email: widget.email.toString(),
                                otp: otpController.text.toString());
                          }
                        }
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
      });
    });
  }

  void dialogeBox(
      {required BuildContext context, required void Function() onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppStrings.resendCode),
          content: const Text(AppStrings.otpCodeSent),
          actions: <Widget>[
            TextButton(
                onPressed: onPressed, child: const Text(AppStrings.resend)),
          ],
        );
      },
    );
  }
}
