import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/create_profile.dart/ctreate_profile3.dart';
import 'package:gap/gap.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../home/home_view.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';
import 'static_profile.dart';

class CreateProfile2 extends StatelessWidget {
  const CreateProfile2({super.key});

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addYoueSubNode2,
            style: context.customFont(
                'Open Sans', 26.0, FontWeight.w600, AppColors.black1),
          ),
          Gap(10),
          Text(
            AppStrings.lorem,
            style: context.customFont(
                'Open Sans', 19.0, FontWeight.w400, AppColors.grey),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.010,
          ),
          AppTextFieldWidget(
            //title: AppStrings.email,
            borderSideColor: AppColors.greyLight,
            hint: AppStrings.addWorkHours,
            hintStyle: context.customFont(
              'Open Sans',
              18.0,
              FontWeight.w400,
              AppColors.grey,
            ),
            fillColor: AppColors.textFill,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.010,
          ),
          AppTextFieldWidget(
            //title: AppStrings.email,
            borderSideColor: AppColors.greyLight,
            hint: AppStrings.title,
            hintStyle: context.customFont(
              'Open Sans',
              18.0,
              FontWeight.w400,
              AppColors.grey,
            ),
            fillColor: AppColors.textFill,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.010,
          ),
          AppTextFieldWidget(
            //title: AppStrings.email,
            borderSideColor: AppColors.greyLight,
            hint: AppStrings.addDescription,
            hintStyle: context.customFont(
              'Open Sans',
              18.0,
              FontWeight.w400,
              AppColors.grey,
            ),
            fillColor: AppColors.textFill,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          AppTextFieldWidget(
            width: MediaQuery.of(context).size.width * 0.400,
            height: MediaQuery.of(context).size.height * 0.1,
            //title: AppStrings.email,
            borderSideColor: AppColors.greyLight,
            hint: AppStrings.addImages,
            hintStyle: context.customFont(
              'Open Sans',
              18.0,
              FontWeight.w400,
              AppColors.grey,
            ),
            fillColor: AppColors.textFill,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          AppButton(
            color: AppColors.white,
            color1: AppColors.themeColor,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeView())),
            height: MediaQuery.of(context).size.height * 0.060,
            width: MediaQuery.of(context).size.width,
            text: AppStrings.addMore,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          AppButton(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateProfile3())),
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
