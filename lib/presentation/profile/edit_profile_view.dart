// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/widgets/custom_text_from_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Cover Photo
          Container(
            height: height * 0.20,
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              // image: DecorationImage(
              //   image: NetworkImage(
              //       'https://www.example.com/cover_photo.jpg'), // Replace with your cover photo URL
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          // Body content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.13), // Spacing for the cover photo
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.borderColor,
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        'https://media.distractify.com/brand-img/IXMXHdSmC/0x0/woman-being-splashed-with-water-1684438561942.jpg', // Replace with your profile picture URL
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                // Body Code
                AppButton(
                  height: 37,
                  width: 100,
                  backgroundColor: AppColors.darkBlue,
                  title: "Change Picture",
                  onPressed: () {},
                ),
                SizedBox(height: height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          title: "Full Name",
                          hintText: "Enter Your Full Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        CustomTextFormField(
                          title: "Email",
                          hintText: "Enter Your Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Basic email validation regex
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        CustomTextFormField(
                          title: "Phone Number",
                          hintText: "Enter Your Phone Number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phone Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        CustomTextFormField(
                          title: "Password",
                          hintText: "Enter Your Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.05),
                AppButton(
                  height: 37,
                  width: 100,
                  backgroundColor: AppColors.darkBlue,
                  title: "Update",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(height: height * 0.09),
              ],
            ),
          ),
          // AppBar with Back Button
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
                ),
                onPressed: () {
                  // Add back button action
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: Text(
                "Edit Profile",
                style: TextStyle(
                  fontFamily: Fonts.fontsOpenSans,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              actions: [
                IconButton(
                  icon: Image.asset(
                    AssetsRes.SHARE_PNG,
                    height: 24,
                  ),
                  onPressed: () {
                    // Add action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
