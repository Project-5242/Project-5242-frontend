import 'package:flutter/material.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/presentation/widgets/app_text_field_widget.dart';
import 'package:provider/provider.dart';

import '../base/helpers/helper.dart';
import '../data/constants/app_colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool obsecureText = true;
  bool newObsecureText = true;
  bool cnfObsecureText = true;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final cnfPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          text: "Change Password",
          color: AppColors.themeColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextFieldWidget(
              controller: oldPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Old password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters.';
                }
                return null;
              },
              password: obsecureText,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                icon: Icon(
                    obsecureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    size: 24.0,
                    color: AppColors.black),
              ),
              title: "Old Password",
              borderSideColor: const Color(0xff858585).withOpacity(0.3),
              hint: 'Enter New Password',
              fillColor: AppColors.textFill,
            ),
            SizedBox(height: 20.0),
            AppTextFieldWidget(
              controller: newPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter New password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters.';
                }
                return null;
              },
              password: newObsecureText,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    newObsecureText = !newObsecureText;
                  });
                },
                icon: Icon(
                    newObsecureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    size: 24.0,
                    color: AppColors.black),
              ),
              title: AppStrings.newPassword,
              borderSideColor: const Color(0xff858585).withOpacity(0.3),
              hint: 'Enter New Password',
              fillColor: AppColors.textFill,
            ),
            SizedBox(height: 20.0),
            AppTextFieldWidget(
              controller: cnfPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Confirm password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters.';
                }
                return null;
              },
              password: cnfObsecureText,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    cnfObsecureText = !cnfObsecureText;
                  });
                },
                icon: Icon(
                    cnfObsecureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_sharp,
                    size: 24.0,
                    color: AppColors.black),
              ),
              title: AppStrings.confirmPassword,
              borderSideColor: const Color(0xff858585).withOpacity(0.3),
              hint: 'Enter Confirm Password',
              fillColor: AppColors.textFill,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton(
          height: 50,
          width: 100,
          backgroundColor: AppColors.darkBlue,
          title: "Save",
          style: TextStyle(fontSize: 20, color: AppColors.white),
          onPressed: () {
            if (oldPasswordController.text.trim().isEmpty) {
              showSnackBar(
                context: context,
                isSuccess: false,
                message: 'Old password cannot be empty.',
              );
            } else if (newPasswordController.text.trim().isEmpty ||
                cnfPasswordController.text.trim().isEmpty) {
              showSnackBar(
                context: context,
                isSuccess: false,
                message: 'New password and confirm password cannot be empty.',
              );
            } else if (newPasswordController.text.trim() !=
                cnfPasswordController.text.trim()) {
              showSnackBar(
                context: context,
                isSuccess: false,
                message: 'New password and confirm password must match.',
              );
            } else {
              // Call the change password API if validation passes
              context.read<SignUpProvider>().callChangePasswordApi(
                    context: context,
                    oldPassword: oldPasswordController.text.trim(),
                    newPassword: newPasswordController.text.trim(),
                  );
            }
          },
        ),
      ),
    );
  }
}
