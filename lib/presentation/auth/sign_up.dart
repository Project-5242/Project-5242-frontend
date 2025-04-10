import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/provider/select_category_view.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../data/constants/app_string.dart';
import '../widgets/app_rich_text.dart';
import '../widgets/app_text_field_widget.dart';

class SignUp extends StatefulWidget {
  final String? roleType;
  const SignUp({super.key, this.roleType});


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
  final TextEditingController bioController = TextEditingController();
  File? _profileImage;
  bool _obsecureText = true;

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
      return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
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
                      ? const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
                      : const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                  children: [
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
                                    color: AppColors.grey,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: _pickImage,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.020,
                    ),
                    AppTextFieldWidget(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z\s]")),
                      ],
                      controller: fullnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
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
                      borderSideColor: const Color(0xff858585).withOpacity(0.3),
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
                      inputType: TextInputType.phone,
                      controller: mobileController,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                        LengthLimitingTextInputFormatter(
                            14), // Limit to a maximum of 14 characters
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        } else if (!RegExp(r"^[0-9]{10,14}$").hasMatch(value)) {
                          return "Enter a valid phone number (10 to 14 digits)";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Show warning if length exceeds 14 digits
                        if (value.length > 14) {
                          showWarning(
                              context, "Phone number cannot exceed 14 digits");
                        }
                      },
                      title: AppStrings.mobilenumber,
                      borderSideColor: AppColors.grey,
                      hint: AppStrings.enteryourMobileNumber,
                      hintStyle: context.customFont(
                        'Open Sans',
                        isDesktop ? 20.0 : 18.0,
                        FontWeight.w400,
                        AppColors.grey,
                      ),
                      fillColor: AppColors.textFill,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.026,
                    ),
                    if (widget.roleType == "provider")
                      AppTextFieldWidget(
                        controller: bioController,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your bio';
                          }
                          return null;
                        },
                        title: "Bio",
                        borderSideColor: AppColors.grey,
                        hint: "Tell us about yourself and your services...",
                        hintStyle: context.customFont(
                          'Open Sans',
                          isDesktop ? 20.0 : 18.0,
                          FontWeight.w400,
                          AppColors.grey,
                        ),
                        fillColor: AppColors.textFill,
                      ),
                    if (widget.roleType == "provider")
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.026,
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          widget.roleType == "provider"
                              ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SelectCategoryView(
                                      roleType: widget.roleType,
                                      emailController: emailController.text
                                          .trim()
                                          .toString(),
                                      fullnameController: fullnameController
                                          .text
                                          .trim()
                                          .toString(),
                                      mobileController: mobileController.text
                                          .trim()
                                          .toString(),
                                      passwordController: passwordController
                                          .text
                                          .trim()
                                          .toString(),
                                      bio: bioController.text.trim().toString(),
                                      profilePhoto: _profileImage,
                                    ),
                                  ),
                                )
                              : signUpValue.callSignUpUserApi(
                                  context: context,
                                  fullName:
                                      fullnameController.text.trim().toString(),
                                  password:
                                      passwordController.text.trim().toString(),
                                  email: emailController.text.trim().toString(),
                                  mobileNumber:
                                      mobileController.text.trim().toString(),
                                  bio: bioController.text.trim().toString());
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
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(
                              roleType: widget.roleType,
                            ),
                          ),
                          (route) => false,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }));
    });
  }

  void showWarning(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
