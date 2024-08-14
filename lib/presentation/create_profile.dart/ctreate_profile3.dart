import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:gap/gap.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../home/home_view.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';
import 'create_profile2.dart';
import 'create_profile4.dart';
import 'static_profile.dart';

class CreateProfile3 extends StatelessWidget {
  const CreateProfile3({super.key});

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addYourLoc,
            style: context.customFont(
                'Open Sans', 26.0, FontWeight.w600, AppColors.black1),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.066,
          ),
          Text(
            AppStrings.lorem,
            style: context.customFont(
                'Open Sans', 19.0, FontWeight.w400, AppColors.grey),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.113,
          ),
          AppButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView())),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.allowCurrentloc,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.034,
          ),
          AppButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView())),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.addMannually,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.165,
          ),
          AppButton(
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
