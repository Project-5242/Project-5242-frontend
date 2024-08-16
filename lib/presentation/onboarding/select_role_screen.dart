import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/routes/routes.dart';

class SelectRoleScreen extends StatefulWidget {
  @override
  _SelectRoleScreenState createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.black),
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
                    color: AppColors.black),
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
}
