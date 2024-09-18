import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/home/dashboard.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile.dart';

import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../../data/models/user.dart';
import '../../domain/bloc/auth/bloc.dart';
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
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isDesktop
                    ? AppStrings.createAccountDes
                    : AppStrings.createAccount,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: SizedBox(
                width: isDesktop
                    ? MediaQuery.of(context).size.width * 0.526
                    : MediaQuery.of(context).size.width,
                child: Form(
                  key: formKey,
                  child: ListView(
                    padding: isDesktop
                        ? EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                        : EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      AppTextFieldWidget(
                        controller: fullnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          } else if (value.length < 6) {
                            return 'Name must be at least 4 characters.';
                          }
                          return null;
                        },
                        title: AppStrings.fullName,
                        borderSideColor: AppColors.grey,
                        hint: AppStrings.enteryourName,
                        hintStyle: context.customFont(
                            'Open Sans',
                            isDesktop ? 20.0 : 18.0,
                            FontWeight.w400,
                            AppColors.grey),
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
                              color: AppColors.themeColor),
                        ),
                        title: AppStrings.password,
                        borderSideColor: Color(0xff858585).withOpacity(0.3),
                        hint: AppStrings.enterPassword,
                        hintStyle: context.customFont(
                            'Open Sans',
                            isDesktop ? 20.0 : 18.0,
                            FontWeight.w400,
                            AppColors.grey),
                        fillColor: AppColors.textFill,
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
                        borderSideColor: AppColors.grey,
                        hint: AppStrings.enterEmail,
                        hintStyle: context.customFont(
                            'Open Sans',
                            isDesktop ? 20.0 : 18.0,
                            FontWeight.w400,
                            AppColors.grey),
                        fillColor: AppColors.textFill,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.026,
                      ),
                      AppTextFieldWidget(
                        controller: mobileController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
                            return "Enter a valid 10\ndigit phone number";
                          }
                          return null;
                        },
                        title: AppStrings.mobilenumber,
                        borderSideColor: AppColors.grey,
                        hint: AppStrings.enteryourMobileNumber,
                        hintStyle: context.customFont(
                            'Open Sans',
                            isDesktop ? 20.0 : 18.0,
                            FontWeight.w400,
                            AppColors.grey),
                        fillColor: AppColors.textFill,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.075,
                      ),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegisterEvent(
                                 UserModel(
                                   email: emailController.text,
                                   password: passwordController.text,
                                   fullName: fullnameController.text,
                                   mobileNumber: mobileController.text
                                 )));
                          }
                        },
                        height: isDesktop
                            ? MediaQuery.of(context).size.height * 0.080
                            : MediaQuery.of(context).size.height * 0.060,
                        width: MediaQuery.of(context).size.width * 0.376,
                        text: AppStrings.signUp,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      RichTextWidget(
                          size: 16.0,
                          color: AppColors.black.withOpacity(0.3),
                          color1: AppColors.themeColor,
                          text: AppStrings.alreadyhaveAccount,
                          text1: AppStrings.signIn,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DashbaordWidget(currentIndex: 0))))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }));
  }
}
