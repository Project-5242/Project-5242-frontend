import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_project/base/extensions/navigation_extension.dart';
import 'package:flutter_project/routes/routes.dart';

class SelectRoleScreen extends StatefulWidget {
  @override
  _SelectRoleScreenState createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _mobileView(context),
      desktop: _desktopView(context),
    );
  }

  Widget _mobileView(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 103, left: 27, right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.selectRole,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue1),
            ),
            const SizedBox(height: 35),
            Text(
              AppStrings.selectRoleSubText,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey2),
            ),
            const SizedBox(height: 73),
            RadioListTile<String>(
              title: Text(
                AppStrings.userText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black1),
              ),
              value: 'user',
              activeColor: AppColors.blue,
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text(
                AppStrings.providerText,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black1),
              ),
              value: 'provider',
              activeColor: AppColors.blue,
              groupValue: _selectedRole,
              onChanged: (String? value) {
                setState(
                  () {
                    _selectedRole = value!;
                  },
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue, // Dark teal color
                minimumSize:
                    const Size(double.infinity, 60), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.modeSelectionScreen,
                  arguments: {"userType": _selectedRole},
                );
              },
              child: Text(
                AppStrings.proceed,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _desktopView(context) {
    return Material(
      color: AppColors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.blue,
              padding: const EdgeInsets.only(left: 85, top: 27, right: 80),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.appName,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: 200.0),
                  Text(
                    AppStrings.welcome,
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    AppStrings.webSubText,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          // Right Side (White Background)
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 153,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.selectRole,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue1),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppStrings.selectRoleSubText,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black),
                  ),
                  const SizedBox(height: 51),
                  RadioListTile(
                    title: Text(
                      AppStrings.userText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                    value: "user",
                    groupValue: _selectedRole,
                    activeColor: AppColors.blue,
                    onChanged: (String? value) {
                      setState(
                        () {
                          _selectedRole = value!;
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      AppStrings.providerText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                    value: "provider",
                    groupValue: _selectedRole,
                    activeColor: AppColors.blue,
                    onChanged: (String? value) {
                      setState(
                        () {
                          _selectedRole = value!;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        AppStrings.proceed,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Text(
                    AppStrings.copyRight,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
