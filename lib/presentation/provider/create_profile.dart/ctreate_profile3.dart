import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:gap/gap.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';

import '../../home/dashboard.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field_widget.dart';
import '../../widgets/custom_button.dart';
import 'create_profile2.dart';
import 'create_profile4.dart';
import 'static_profile.dart';

class CreateProfile3 extends StatelessWidget {
  final int currentIndex;
  final int totalSteps;
  const CreateProfile3(
      {super.key, required this.currentIndex, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      currentIndex: currentIndex,
      totalSteps: totalSteps,
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
                'Open Sans', 24.0, FontWeight.w600, AppColors.black1),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.030,
          ),
          Text(
            AppStrings.lorem,
            style: context.customFont('Open Sans', 19.0, FontWeight.w400,
                AppColors.black1.withOpacity(0.3)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.113,
          ),
          CustomButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashbaordWidget(currentIndex: 0))),
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
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => DashbaordWidget(currentIndex: 0))),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.addMannually,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.165,
          ),
          CustomButton(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateProfile4())),
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
}
