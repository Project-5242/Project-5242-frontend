// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';

import '../ContentPage/contentPage.dart';
import 'components/custom_listview.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.setting,
          style: TextStyle(
            fontFamily: Fonts.fontsOpenSans,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkBlue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Divider(color: AppColors.dividerColor),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _generalList(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _accountList(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _otherList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _generalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.general,
          style: TextStyle(
            fontFamily: Fonts.fontsinter,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 10),
        CustomListView(
          title: AppStrings.language,
          onPressed: () {},
        ),
        _lineview(),
        CustomListView(
          title: AppStrings.notificationSettings,
          onPressed: () {},
        ),
        _lineview(),
        CustomListView(
          title: AppStrings.location,
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
              activeTrackColor: AppColors.switchButtonColor,
              activeColor: AppColors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _accountList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.accountSecrity,
          style: TextStyle(
            fontFamily: Fonts.fontsinter,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 10),
        CustomListView(
          title: AppStrings.emailandMobileNumber,
          onPressed: () {},
        ),
        _lineview(),
        CustomListView(
          title: AppStrings.securitySettings,
          onPressed: () {},
        ),
        _lineview(),
        CustomListView(
          title: AppStrings.deleteAccount,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _otherList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.other,
          style: TextStyle(
            fontFamily: Fonts.fontsinter,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 10),
        CustomListView(
          title: AppStrings.privacyPolicy,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    const ContentPage(name: "Privacy & Policy"),
              ),
            );
          },
        ),
        _lineview(),
        CustomListView(
          title: AppStrings.termsandConditions,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    const ContentPage(name: "Terms & Conditions"),
              ),
            );
          },
        ),
        _lineview(),
        const SizedBox(height: 6),
        CustomListView(
          title: AppStrings.rateApp,
          trailing: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "v4.87.2",
              style: TextStyle(
                color: AppColors.iconColor,
                fontFamily: Fonts.fontsinter,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _lineview() {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Divider(color: AppColors.dividerColor.withOpacity(0.5)),
    );
  }
}
