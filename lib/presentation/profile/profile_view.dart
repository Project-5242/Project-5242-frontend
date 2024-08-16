// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
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
                      _customListTile(title: "Notification", onTap: () {}),
                      _customListTile(title: "Setting", onTap: () {}),
                      _customListTile(title: "Privacy & Policy", onTap: () {}),
                      _customListTile(
                          title: "Terms & Conditions", onTap: () {}),
                      _customListTile(title: "Change Password", onTap: () {}),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.09),
                AppButton(
                  height: 37,
                  width: 100,
                  backgroundColor: AppColors.darkBlue,
                  title: "Logout",
                  onPressed: () {},
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
              leading: IconButton(
                icon: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
                onPressed: () {
                  Navigator.pop(context);
                  // Add back button action
                },
              ),
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
