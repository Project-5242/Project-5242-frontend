import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/presentation/widgets/app_text_field_widget.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.welcome,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Text(
            AppStrings.signIn,
            style: context.displaySmall.copyWith(fontWeight: FontWeight.bold),
          ),
          Gap(5),
          Text(
            AppStrings.loginSubTitle,
            style: context.labelLarge,
          ),
          const Gap(20),
          AppTextFieldWidget(
            title: AppStrings.email,
            hint: AppStrings.hintEmail,
            inputFormatters: AppTextInputFormatters.withEmailFormatter(),
          ),
          const Gap(10),
          AppTextFieldWidget(
            title: AppStrings.password,
            hint: AppStrings.hintPassword,
            password: true,
            suffix: Icon(
              Icons.visibility_off,
              color: context.theme.primaryColor,
            ),
          ),
          Gap(10),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                context.pushNamed(Routes.forgetPasswordScreen);
              },
              child: Text(
                AppStrings.forgetPassword,
                style: context.titleMedium,
              ),
            ),
          ),
          const Gap(20),
          AppButton(
            onTap: () {
              context.pushNamed(Routes.mainScreen);
            },
            title: AppStrings.signIn,
          ),
          const Gap(20),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: AppStrings.dontHaveAccount,
                style: context.titleSmall.copyWith(color: Colors.grey),
              ),
              TextSpan(
                  text: AppStrings.signUp,
                  style: context.titleSmall
                      .copyWith(color: context.theme.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushNamed(Routes.registerScreen);
                    })
            ])),
          )
        ],
      ),
    );
  }
}
