import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:gap/gap.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';

import '../../home/dashboard.dart';
import '../../../routes/routes.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field_widget.dart';
import '../../widgets/custom_button.dart';
import 'create_profile2.dart';
import 'create_profile4.dart';
import 'static_profile.dart';

class CreateProfile3 extends StatefulWidget {
  final int currentIndex;
  final int totalSteps;
  const CreateProfile3(
      {super.key, required this.currentIndex, required this.totalSteps});

  @override
  State<CreateProfile3> createState() => _CreateProfile3State();
}

class _CreateProfile3State extends State<CreateProfile3> {
  final int totalSteps = 3;

  void _nextStep() {
    if (currentIndex < totalSteps - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousStep() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return StaticProfileLayout(
      currentIndex: widget.currentIndex,
      totalSteps: widget.totalSteps,
      middleContentBuilder: () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.066,
          ),
          Text(
            AppStrings.addYourLoc,
            style: context.customFont(
                'Open Sans', 24.0, FontWeight.w600, AppColors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.030,
          ),
          Text(
            AppStrings.lorem,
            style: context.customFont('Open Sans', 19.0, FontWeight.w400,
                AppColors.black.withOpacity(0.3)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.113,
          ),
          CustomButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashbaordWidget(currentIndex: 0))),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.allowCurrentloc,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.034,
          ),
          CustomButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () {
              Navigator.pushNamed(context, Routes.dashbaord);
            },
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.addMannually,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.165,
          ),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.createProfile4);
            },
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.next,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
        ],
      ),
    );
  }

  _deskTopView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                        spreadRadius: 0,
                      ),
                    ],
                    border: Border.all(
                        width: 1.0, color: AppColors.black1.withOpacity(0.25))),
                height: responsive.isTablet
                    ? MediaQuery.of(context).size.height * 0.800
                    : MediaQuery.of(context).size.height * 0.800,
                width: responsive.isTablet
                    ? MediaQuery.of(context).size.width * 0.700
                    : MediaQuery.of(context).size.width * 0.500,
                child: Padding(
                    padding: responsive.isTablet
                        ? const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10)
                        : const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              color: AppColors.themeColor,
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                _previousStep;
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              '3/${totalSteps}',
                              style: TextStyle(
                                color: AppColors.themeColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        LinearProgressIndicator(
                          value: 2 / totalSteps,
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(4),
                          minHeight: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        Text(
                          AppStrings.addYourLoc,
                          style: context.customFont('Open Sans', 24.0,
                              FontWeight.w600, AppColors.black),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.020,
                        ),
                        Text(
                          AppStrings.lorem,
                          style: context.customFont(
                              'Open Sans',
                              19.0,
                              FontWeight.w400,
                              AppColors.black.withOpacity(0.3)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.070,
                        ),
                        CustomButton(
                          color: AppColors.white,
                          color1: AppColors.themeColor,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DashbaordWidget(currentIndex: 0))),
                          height: MediaQuery.of(context).size.height * 0.080,
                          width: MediaQuery.of(context).size.width * 0.200,
                          text: AppStrings.allowCurrentloc,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        CustomButton(
                          color: AppColors.white,
                          color1: AppColors.themeColor,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.dashbaord);
                          },
                          height: MediaQuery.of(context).size.height * 0.080,
                          width: MediaQuery.of(context).size.width * 0.200,
                          text: AppStrings.addMannually,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.070,
                        ),
                        CustomButton(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.createProfile4);
                          },
                          height: MediaQuery.of(context).size.height * 0.080,
                          width: MediaQuery.of(context).size.width * 0.200,
                          text: AppStrings.next,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ],
                    )))));
  }
}
