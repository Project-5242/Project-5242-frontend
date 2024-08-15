import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/presentation/widgets/app_rich_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/constants/app_string.dart';
import '../../res/assets_res.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  final Widget midleWidget;
  const ChangePasswordScreen({super.key, required this.midleWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 21.0,
              color: Colors.black,
            )),
        title: const Text(
          AppStrings.changePassword,
        ),
        centerTitle: true,
      ),
      body: midleWidget,
    ));
  }
}

class ChangePassword1 extends StatelessWidget {
  ChangePassword1({super.key});
  final TextEditingController emailController = TextEditingController();
  final uniqueKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangePasswordScreen(
      midleWidget: Form(
        // key: uniqueKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Image.asset(
              AssetsRes.PASSWORD1,

              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.150,
              width: MediaQuery.of(context).size.width * 0.150,
              // ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            Text(
              textAlign: TextAlign.center,
              AppStrings.forgetPassword,
              style: context.customFont(
                  'Open Sans', 20.0, FontWeight.w700, Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.010,
            ),
            Text(
              textAlign: TextAlign.center,
              AppStrings.enterEmailAddress,
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
              borderSideColor: Color(0xff858585).withOpacity(0.3),
              hint: AppStrings.enterEmail,
              hintStyle: context.customFont(
                  'Open Sans', 18.0, FontWeight.w400, AppColors.grey),
              fillColor: AppColors.textFill,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.131,
            ),
            AppButton(
              onTap: () {
                //   if (uniqueKey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword2()));
                //   }
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width * 0.200,
              text: AppStrings.sendEmail,
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePassword2 extends StatelessWidget {
  ChangePassword2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangePasswordScreen(
      midleWidget: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
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
                  strokeColorBuilder: FixedColorBuilder(AppColors.themeColor),
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
          AppButton(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChangePassword3())),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width * 0.275,
            text: AppStrings.verify,
          ),
        ],
      ),
    );
  }

  void _dialogeBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width,
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
                  AppButton(
                    onTap: () => Navigator.pop(context),
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width * 0.275,
                    text: AppStrings.ok,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ChangePassword3 extends StatefulWidget {
  const ChangePassword3({super.key});

  @override
  State<ChangePassword3> createState() => _ChangePassword3State();
}

class _ChangePassword3State extends State<ChangePassword3> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obsecureText = true;
  bool _obsecure = true;
  @override
  Widget build(BuildContext context) {
    return ChangePasswordScreen(
      midleWidget: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Image.asset(
              AssetsRes.PASSWORD3,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.150,
              width: MediaQuery.of(context).size.width * 0.150,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.044,
            ),
            Text(
              textAlign: TextAlign.center,
              AppStrings.createNewPassword,
              style: context.customFont(
                  'Open Sans', 20.0, FontWeight.w700, Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.010,
            ),
            Text(
              textAlign: TextAlign.center,
              AppStrings.newPasswordDifferent,
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
                  _obsecureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
              title: AppStrings.newPassword,
              borderSideColor: AppColors.greyLight,
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
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            AppTextFieldWidget(
              controller: confirmpassController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value != passwordController) {
                  return ' Confirm Password does not match with password ';
                }
                return null;
              },
              password: _obsecure,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecure = !_obsecure;
                  });
                },
                icon: Icon(
                  _obsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
              title: AppStrings.confirmPassword,
              borderSideColor: AppColors.greyLight,
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
              height: MediaQuery.of(context).size.height * 0.131,
            ),
            AppButton(
              onTap: () {
                if (formKey.currentState!.validate()) ;
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width * 0.275,
              text: AppStrings.resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
