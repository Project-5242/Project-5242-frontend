import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:gap/gap.dart';

import '../../data/constants/app_string.dart';
import '../../res/assets_res.dart';
import '../../routes/routes.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
            AssetsRes.IC_CHANGE_PASSWORD,
            height: 150,
          ),
          Text(
            AppStrings.createNewPassword,
            style: context.titleLarge,
            textAlign: TextAlign.center,
          ),
          Gap(10),
          Text(
            AppStrings.hintNewPassword,
            style: context.labelLarge,
            textAlign: TextAlign.center,
          ),
          Gap(20),
          AppTextFieldWidget(
            title: AppStrings.newPassword,
            hint: AppStrings.hintPassword,
            password: true,
            suffix: Icon(
              Icons.visibility_off,
              color: context.theme.primaryColor,
            ),
          ),
          Gap(20),
          AppTextFieldWidget(
            title: AppStrings.confirmPassword,
            hint: AppStrings.hintPassword,
            password: true,
            suffix: Icon(
              Icons.visibility_off,
              color: context.theme.primaryColor,
            ),
          ),
          Gap(30),
          AppButton(
            onTap: () {
              context.pushNamed(Routes.mainScreen);
            },
            title: AppStrings.resetPassword,
          )
        ],
      ),
    );
  }
}
