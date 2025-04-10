import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/presentation/widgets/app_text_field_widget.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:flutter_project/presentation/widgets/app_rich_text.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import 'AuthProvider/sign_up_provider.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return Container(
        child: isDesktop ? const DesktopCreateAccount() : const MobileCreateAccount(),
      );
    });
  }
}

class MobileCreateAccount extends StatefulWidget {
  const MobileCreateAccount({super.key});

  @override
  State<MobileCreateAccount> createState() => _MobileCreateAccountState();
}

class _MobileCreateAccountState extends State<MobileCreateAccount> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController(); // Add this line
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  File? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, signUpValue, child) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                Text(
                  'Create Account',
                  style: context.displaySmall.copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text(
                  'Join our community and start your journey',
                  style: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.black,
                  ),
                ),
                const Gap(30),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textFill,
                          image: _profileImage != null
                              ? DecorationImage(
                                  image: FileImage(_profileImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _profileImage == null
                            ? Icon(
                                Icons.person,
                                size: 60,
                                color: AppColors.grey.withOpacity(0.5),
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                AppTextFieldWidget(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  title: 'Full Name',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Enter your full name',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(20),
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
                  title: 'Email',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Enter your email',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(20),
                AppTextFieldWidget(
                  controller: mobileNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  title: 'Mobile Number',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Enter your mobile number',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(20),
                AppTextFieldWidget(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  password: _obscurePassword,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      size: 24.0,
                      color: AppColors.themeColor,
                    ),
                  ),
                  title: 'Password',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Enter your password',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(20),
                AppTextFieldWidget(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  password: _obscureConfirmPassword,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      size: 24.0,
                      color: AppColors.themeColor,
                    ),
                  ),
                  title: 'Confirm Password',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Confirm your password',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(20),
                AppTextFieldWidget(
                  controller: bioController,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bio';
                    }
                    return null;
                  },
                  title: 'Bio',
                  borderSideColor: AppColors.greyLight,
                  hint: 'Tell us about yourself',
                  hintStyle: context.customFont(
                    'Open Sans',
                    18.0,
                    FontWeight.w400,
                    AppColors.grey,
                  ),
                  fillColor: AppColors.textFill,
                ),
                const Gap(30),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // Handle sign up logic here
                      print('SignUp params before call:');
                      print('email: ${emailController.text.trim()}');
                      print('password: ${passwordController.text.trim()}');
                      print('fullName: ${nameController.text.trim()}');
                      print('bio: ${bioController.text.trim()}');
                      print('mobileNumber: ${mobileNumberController.text.trim()}');
                      print('profilePhoto: ${_profileImage?.path}');
                      
                      signUpValue.callSignUpUserApi(
                        context: context,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        fullName: nameController.text.trim(),
                        bio: bioController.text.trim(),
                        mobileNumber: mobileNumberController.text.trim(),
                        profilePhoto: _profileImage,
                      );
                      
                      print('SignUp call completed');
                    }
                  },
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width * 0.376,
                  text: 'Create Account',
                ),
                const Gap(20),
                RichTextWidget(
                  size: 16.0,
                  color: AppColors.black.withOpacity(0.3),
                  color1: AppColors.themeColor,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                  text: 'Already have an account? ',
                  text1: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DesktopCreateAccount extends StatefulWidget {
  const DesktopCreateAccount({super.key});

  @override
  State<DesktopCreateAccount> createState() => _DesktopCreateAccountState();
}

class _DesktopCreateAccountState extends State<DesktopCreateAccount> {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement desktop layout
    return const Placeholder();
  }
}
