import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:gap/gap.dart';

import '../../routes/routes.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text(AppStrings.createAnAccount),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          AppTextFieldWidget(
            title: AppStrings.name,
            hint: AppStrings.hintName,
            inputFormatters: AppTextInputFormatters.withNameFormatter(),
          ),
          const Gap(10),
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
          AppTextFieldWidget(
            title: AppStrings.phone,
            hint: AppStrings.hintPhone,
            prefix: InkWell(
              onTap: () async {
                const countryPicker = FlCountryCodePicker(localize: true);

                final picked = await countryPicker.showPicker(context: context);
                // Null check
                if (picked != null) print(picked.dialCode);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('+91', style: context.titleSmall),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            inputFormatters: AppTextInputFormatters.withPhoneNumberFormatter(),
          ),
          const Gap(20),
          AppButton(
            onTap: () {
              context.pushNamed(Routes.mainScreen);
            },
            title: AppStrings.signUp,
          ),
          const Gap(20),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: AppStrings.alreadyHaveAccount,
                style: context.titleSmall.copyWith(color: Colors.grey),
              ),
              TextSpan(
                  text: AppStrings.signIn,
                  style: context.titleSmall
                      .copyWith(color: context.theme.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pop();
                    })
            ])),
          )
        ],
      ),
    );
  }
}
