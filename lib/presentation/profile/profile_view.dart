// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/ChangePasswordPage.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/settings/setting_view.dart';
import 'package:flutter_project/presentation/widgets/custom_text_from_field.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../ContentPage/contentPage.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isSettingVisible = false;
  bool _passHide = true;
  final _formKeyDesk = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ResponsiveView(
      mobile: _mobileView(height, context),
      tablet: _mobileView(height, context),
      desktop: _desktopView(height, context),
    );
  }

  Widget _desktopView(double height, BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, signupValue, child) {
      return Material(
        color: AppColors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: Fonts.fontsOpenSans,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Card(
                        elevation: 30,
                        shadowColor: AppColors.black,
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: AppColors.borderColor,
                                    child: const CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Googleplex_HQ_%28cropped%29.jpg/1200px-Googleplex_HQ_%28cropped%29.jpg', // Replace with your profile picture URL
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
                                  title: "Edit Profile",
                                  onPressed: () {
                                    setState(() {
                                      isSettingVisible = false;
                                    });
                                  },
                                ),
                                SizedBox(height: height * 0.04),
                                _customListTile(
                                    title: "Notification", onTap: () {}),
                                _customListTile(
                                    title: "Setting",
                                    onTap: () {
                                      setState(() {
                                        isSettingVisible = true;
                                      });
                                    }),
                                _customListTile(
                                    title: "Privacy & Policy", onTap: () {}),
                                _customListTile(
                                    title: "Terms & Conditions", onTap: () {}),
                                _customListTile(
                                    title: "Change Password", onTap: () {}),
                                SizedBox(height: height * 0.09),
                                AppButton(
                                  height: 37,
                                  width: 100,
                                  backgroundColor: AppColors.darkBlue,
                                  title: "Logout",
                                  onPressed: () {
                                    showLogoutDialog(
                                        context: context, onPressed: () {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 5,
                      child: Card(
                        elevation: 30,
                        shadowColor: AppColors.black,
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: isSettingVisible
                            ? const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 90, vertical: 40),
                                child: SettingView(),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 55,
                                          backgroundColor:
                                              AppColors.borderColor,
                                          child: const CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Googleplex_HQ_%28cropped%29.jpg/1200px-Googleplex_HQ_%28cropped%29.jpg', // Replace with your profile picture URL
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        AppButton(
                                          height: 37,
                                          width: 100,
                                          backgroundColor: AppColors.darkBlue,
                                          title: "Change Picture",
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SingleChildScrollView(
                                      child: Form(
                                        key: _formKeyDesk,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40,
                                              bottom: 20,
                                              left: 16,
                                              right: 40),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomTextFormField(
                                                title: "Full Name",
                                                hintText:
                                                    "Enter Your Full Name",
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter your email';
                                                  }
                                                  if (!RegExp(
                                                          r'^[^@]+@[^@]+\.[^@]+')
                                                      .hasMatch(value)) {
                                                    return 'Please enter a valid email address';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(height: height * 0.03),
                                              CustomTextFormField(
                                                title: "Phone Number",
                                                hintText:
                                                    "Enter Your Phone Number",
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter Phone Number';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(height: height * 0.03),
                                              CustomTextFormField(
                                                title: "Password",
                                                hintText: "Enter Your Password",
                                                obscureText: _passHide,
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _passHide
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: AppColors.black,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _passHide = !_passHide;
                                                    });
                                                  },
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
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
                                                backgroundColor:
                                                    AppColors.darkBlue,
                                                title: "Update",
                                                onPressed: () {
                                                  if (_formKeyDesk.currentState!
                                                      .validate()) {
                                                    // Handle form submission
                                                  }
                                                },
                                              ),
                                              SizedBox(height: height * 0.19),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _mobileView(double height, BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, profileValue, child) {
      return Scaffold(
        body: Stack(
          children: [
            // Cover Photo
            Container(
              height: height * 0.20,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
              ),
            ),
            // Body content
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: height * 0.13), // Spacing for the cover photo
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.borderColor,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "${sharedPrefs?.getString(AppStrings.userImage)}"),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  if (Theme.of(context).platform == TargetPlatform.android)
                    AppButton(
                      height: 37,
                      width: 100,
                      backgroundColor: AppColors.darkBlue,
                      title: "Edit Profile",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditProfileView(),
                          ),
                        );
                      },
                    )
                  else if (Theme.of(context).platform == TargetPlatform.android)
                    AppButton(
                      height: 37,
                      width: 100,
                      backgroundColor: AppColors.darkBlue,
                      title: "Edit Profile",
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.editProfileView);
                      },
                    ),

                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: Column(
                      children: [
                        _customListTile(
                            title: "Notification",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationView(),
                                ),
                              );
                            }),
                        _customListTile(
                            title: "Setting",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SettingView(),
                                ),
                              );
                            }),
                        _customListTile(
                            title: "Privacy & Policy",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ContentPage(
                                      name: "Privacy & Policy"),
                                ),
                              );
                            }),
                        _customListTile(
                            title: "Terms & Conditions",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ContentPage(
                                      name: "Terms & Conditions"),
                                ),
                              );
                            }),
                        _customListTile(
                          title: "Change Password",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChangePasswordPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.09),
                  AppButton(
                    height: 37,
                    width: 100,
                    backgroundColor: AppColors.darkBlue,
                    title: "Logout",
                    onPressed: () {
                      showLogoutDialog(
                          context: context,
                          onPressed: () {
                            profileValue.callLogout(context: context);
                          });
                    },
                  ),
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
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: Fonts.fontsOpenSans,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(AssetsRes.Notification_SVG),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _customListTile({String? title, void Function()? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      onTap: onTap,
      leading: Text(
        title ?? "",
        style: TextStyle(
          fontFamily: Fonts.fontsOpenSans,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      trailing: Image.asset(
        AssetsRes.ARROWFORWARD_PNG,
        height: 24,
        width: 24,
      ),
    );
  }
}
