import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_project/base/extensions/context_extension.dart';
import 'package:flutter_project/base/extensions/navigation_extension.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:gap/gap.dart';

import '../../data/constants/app_string.dart';
import '../widgets/app_button.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.changePassword),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Image.asset(AssetsRes.IC_VERIFY_OTP, height: 150),
          Gap(20),
          Text(
            AppStrings.verifyOTP,
            style: context.titleLarge,
            textAlign: TextAlign.center,
          ),
          Gap(10),
          Text(
            AppStrings.hintOTP,
            style: context.labelLarge,
            textAlign: TextAlign.center,
          ),
          Gap(20),
          PinCodeFields(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            length: 4,
            fieldHeight: 60,
            borderRadius: BorderRadius.circular(10),
            keyboardType: TextInputType.number,
            activeBorderColor: context.theme.primaryColor,
            fieldBorderStyle: FieldBorderStyle.square,
            onComplete: (String value) => print(value),
          ),
          Gap(30),
          AppButton(
            onTap: () {
              context.pushNamed(Routes.changePasswordScreen);
            },
            title: AppStrings.verify,
          ),
          Gap(30),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: AppStrings.dontHaveCode,
                style: context.titleSmall.copyWith(color: Colors.grey),
              ),
              TextSpan(
                  text: AppStrings.resend,
                  style: context.titleSmall
                      .copyWith(color: context.theme.primaryColor),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ])),
          ),
        ],
      ),
    );
  }
}
