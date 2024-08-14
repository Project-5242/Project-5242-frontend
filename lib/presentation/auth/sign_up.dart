import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/create_profile.dart/create_profile.dart';
import 'package:flutter_project/presentation/home/home_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../widgets/app_button.dart';
import '../widgets/app_rich_text.dart';
import '../widgets/app_text_field_widget.dart';
import 'change_password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.createAccount,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            AppTextFieldWidget(
              title: AppStrings.fullName,
              borderSideColor: AppColors.grey,
              hint: AppStrings.enteryourName,
              hintStyle: context.customFont(
                  'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
              fillColor: AppColors.textFill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            AppTextFieldWidget(
              password: _obsecureText,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                icon: Icon(
                    _obsecureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    size: 24.0,
                    color: AppColors.themeColor),
              ),
              title: AppStrings.password,
              borderSideColor: Color(0xff858585).withOpacity(0.3),
              hint: AppStrings.enterPassword,
              hintStyle: context.customFont(
                  'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
              fillColor: AppColors.textFill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            AppTextFieldWidget(
              title: AppStrings.email,
              borderSideColor: AppColors.grey,
              hint: AppStrings.enterEmail,
              hintStyle: context.customFont(
                  'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
              fillColor: AppColors.textFill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            AppTextFieldWidget(
              title: AppStrings.mobilenumber,
              borderSideColor: AppColors.grey,
              hint: AppStrings.enteryourMobileNumber,
              hintStyle: context.customFont(
                  'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
              fillColor: AppColors.textFill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            AppButton(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateProfile())),
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width * 0.376,
              text: AppStrings.signUp,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            RichTextWidget(
                size: 16.0,
                color: AppColors.black,
                color1: AppColors.themeColor,
                text: AppStrings.alreadyhaveAccount,
                text1: AppStrings.signIn,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView())))
          ],
        ),
      ),
    );
  }
}
