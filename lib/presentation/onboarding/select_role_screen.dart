import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/onboarding/mode_selection_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/helpers/helper.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  SelectRoleScreenState createState() => SelectRoleScreenState();
}

class SelectRoleScreenState extends State<SelectRoleScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  String _selectedRole = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRoleCard({
    required String title,
    required String value,
    required String icon,
    required String description,
  }) {
    bool isSelected = _selectedRole == value;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: () {
        setState(() {
          _selectedRole = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.blue.withOpacity(0.1)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    icon,
                    color: isSelected ? AppColors.blue : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? AppColors.blue : AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: ResponsiveView(
        mobile: _mobileView(context),
        desktop: _desktopView(context),
      ),
    );
  }

  Widget _mobileView(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              AppStrings.selectRole,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: AppColors.blue1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.selectRoleSubText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.grey2,
              ),
            ),
            const SizedBox(height: 50),
            _buildRoleCard(
              title: AppStrings.userText,
              value: 'user',
              icon: 'assets/svg_icons/user_role.svg',
              description: 'Browse and connect with service providers',
            ),
            const SizedBox(height: 20),
            _buildRoleCard(
              title: AppStrings.providerText,
              value: 'provider',
              icon: 'assets/svg_icons/provider_role.svg',
              description: 'Offer your services to potential clients',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_selectedRole.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a role to proceed."),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ModeSelectionScreen(
                        type: _selectedRole,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                AppStrings.proceed,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            )
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
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 153),
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
                  RadioListTile<String>(
                    title: Text(
                      AppStrings.userText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                    value: 'user',
                    groupValue: _selectedRole,
                    activeColor: AppColors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRole = value!;
                        log('Selected role: $_selectedRole, is Provider: ${_selectedRole == 'provider'}');
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      AppStrings.providerText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                    value: 'provider',
                    groupValue: _selectedRole,
                    activeColor: AppColors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRole = value!;
                        log('Selected role: $_selectedRole, is Provider: ${_selectedRole == 'provider'}');
                      });
                    },
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ModeSelectionScreen(
                              type: _selectedRole,
                            ),
                          ),
                        );
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
