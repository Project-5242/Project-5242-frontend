import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/widgets/custom_text_from_field.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return ResponsiveView(
      mobile: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final response = ResponsiveCheck(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with Cover Photo and Centered Profile Picture
          SliverAppBar(
            expandedHeight: response.isMobile ? height * 0.23 : height * 0.30,
            // expandedHeight: height * 0.33,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    height: height * 0.18,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //       'https://media.distractify.com/brand-img/IXMXHdSmC/0x0/woman-being-splashed-with-water-1684438561942.jpg'), // Replace with your cover photo URL
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.12,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.borderColor,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://media.distractify.com/brand-img/IXMXHdSmC/0x0/woman-being-splashed-with-water-1684438561942.jpg', // Replace with your profile picture URL
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              AppStrings.editProfile,
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
          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Form(
                child: Column(
                  children: [
                    // Adjust spacing
                    AppButton(
                      height: 37,
                      width: 100,
                      backgroundColor: AppColors.darkBlue,
                      title: "Change Picture",
                      onPressed: () {},
                    ),
                    SizedBox(height: height * 0.04),
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
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility_off,
                          color: AppColors.black,
                        ),
                        onPressed: () {},
                      ),
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
                    SizedBox(height: height * 0.05),
                    AppButton(
                      height: 37,
                      width: 100,
                      backgroundColor: AppColors.darkBlue,
                      title: "Update",
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   // Handle form submission
                        // }
                      },
                    ),
                    SizedBox(height: height * 0.19),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
