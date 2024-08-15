import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/home/home_view.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/presentation/widgets/app_rich_text.dart';
import 'package:flutter_project/presentation/widgets/app_text_field_widget.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';

import 'package:gap/gap.dart';

import '../../data/constants/app_colors.dart';
import 'change_password.dart';
import 'sign_up.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obsecureText = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.welcome,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Text(
                AppStrings.signIn,
                style:
                    context.displaySmall.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text(
                AppStrings.loginSubTitle,
                style: context.customFont(
                    'Open Sans', 18.0, FontWeight.w400, AppColors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.077,
              ),
              AppTextFieldWidget(
                controller: emailController,
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
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.026,
              ),
              AppTextFieldWidget(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters.';
                  }
                  return null;
                },
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
                    color: AppColors.themeColor,
                  ),
                ),
                //  Image.asset(
                //   'assets/icon/eye-closed.png',
                //   height: MediaQuery.of(context).size.height * 0.024,
                //   width: MediaQuery.of(context).size.width * 0.024,
                //   fit: BoxFit.contain,
                // ),
                title: AppStrings.password,
                borderSideColor: Color(0xff858585).withOpacity(0.3),
                hint: AppStrings.enterPassword,
                hintStyle: context.customFont(
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword1())),
                child: Text(
                  textAlign: TextAlign.right,
                  AppStrings.forgetPassword,
                  style: context.titleSmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate())
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                },
                height: MediaQuery.of(context).size.height * 0.060,
                width: MediaQuery.of(context).size.width * 0.376,
                text: AppStrings.signIn,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              RichTextWidget(
                  size: 16.0,
                  color: AppColors.black,
                  color1: AppColors.themeColor,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                    // Get.to(SignUp());
                  },
                  text: AppStrings.donthaveAccount,
                  text1: AppStrings.signUp)
            ],
          ),
        ),
      ),
    );
  }
}
