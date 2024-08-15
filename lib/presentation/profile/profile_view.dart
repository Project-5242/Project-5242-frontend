// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Column profileAvatar() {
      return Column(
        children: [
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
        ],
      );
    }

    Padding settingOption() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            _customListTile(title: "Notification", onTap: () {}),
            _customListTile(title: "Setting", onTap: () {}),
            _customListTile(title: "Privacy & Policy", onTap: () {}),
            _customListTile(title: "Terms & Conditions", onTap: () {}),
            _customListTile(title: "Change Password", onTap: () {}),
          ],
        ),
      );
    }

    AppButton logOut() {
      return AppButton(
        height: 37,
        width: 100,
        backgroundColor: AppColors.darkBlue,
        title: "Logout",
        onPressed: () {},
      );
    }

    Positioned backGround() {
      return Positioned(
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
      );
    }

    Stack isMobile() {
      return Stack(
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
                profileAvatar(),
                SizedBox(height: height * 0.04),
                settingOption(),
                SizedBox(height: height * 0.09),
                logOut(),
              ],
            ),
          ),
          // AppBar with Back Button
          backGround(),
        ],
      );
    }

    Widget buildProfileCard(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              const Spacer(),
              profileAvatar(),
              _customListTile(title: 'Notification', onTap: () {}, isWeb: true),
              _customListTile(title: 'Setting', onTap: () {}, isWeb: true),
              _customListTile(
                  title: 'Privacy & Policy', onTap: () {}, isWeb: true),
              _customListTile(
                  title: 'Terms & Conditions', onTap: () {}, isWeb: true),
              _customListTile(
                  title: 'Change Password', onTap: () {}, isWeb: true),
              const Spacer(
                flex: 2,
              ),
              logOut(),
              const Spacer(),
            ],
          ),
        ),
      );
    }

    Widget buildSettingsCard(BuildContext context) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                settingTitle(title: 'General'),
                _customListTile(title: 'Language', onTap: () {}, isWeb: true),
                _customListTile(
                    title: 'Notification Settings', onTap: () {}, isWeb: true),
                _customListTile(title: 'Location', isWeb: true),
                settingTitle(title: 'Account & Security'),
                _customListTile(
                    title: 'Email and Mobile Number',
                    onTap: () {},
                    isWeb: true),
                _customListTile(
                    title: 'Security Settings', onTap: () {}, isWeb: true),
                _customListTile(
                    title: 'Delete Account', onTap: () {}, isWeb: true),
                settingTitle(title: 'Other'),
                _customListTile(
                    title: 'Privacy Policy', onTap: () {}, isWeb: true),
                _customListTile(
                    title: 'Terms and Conditions', onTap: () {}, isWeb: true),
                _customListTile(title: 'Rate App', onTap: () {}, isWeb: true),
                const SizedBox(height: 10.0),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'v4.87.2',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    isWeb() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 8, vertical: height / 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: buildProfileCard(context)),
            Expanded(child: buildSettingsCard(context)),
          ],
        ),
      );
    }

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return isWeb();
      } else {
        return isMobile();
      }
    }));
  }

  Padding settingTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _customListTile(
      {String? title, void Function()? onTap, bool isWeb = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      onTap: onTap,
      leading: Text(
        title ?? "",
        style: TextStyle(
          fontFamily: Fonts.fontsOpenSans,
          fontSize: isWeb ? 16 : 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      trailing: Image.asset(
        AssetsRes.ARROWFORWARD_PNG,
        height: isWeb ? 15 : 24,
        width: isWeb ? 15 : 24,
      ),
    );
  }
}
