import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/navigation_extension.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/presentation/widgets/app_text_field_widget.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.changePassword),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Image.asset(
            AssetsRes.IC_FORGOT_PASSWORD,
            height: 150,
          ),
          Text(
            AppStrings.forgetPassword,
            style: context.titleLarge,
            textAlign: TextAlign.center,
          ),
          Gap(10),
          Text(
            AppStrings.hintForgotPassword,
            style: context.labelLarge,
            textAlign: TextAlign.center,
          ),
          Gap(20),
          AppTextFieldWidget(
            title: AppStrings.email,
            hint: AppStrings.hintEmail,
          ),
          Gap(30),
          AppButton(
            onTap: () {
              context.pushNamed(Routes.verifyOtpScreen);
            },
            title: AppStrings.sendEmail,
          )
        ],
      ),
    );
  }
}
