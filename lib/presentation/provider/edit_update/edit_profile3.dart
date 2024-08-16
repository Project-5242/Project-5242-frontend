import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';

import 'package:flutter_project/presentation/provider/edit_update/edit_profile4.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/constants/app_string.dart';
import '../../../routes/routes.dart';
import '../../home/dashboard.dart';
import '../../widgets/custom_button.dart';
import '../create_profile.dart/create_profile4.dart';

class EditProfile3 extends StatelessWidget {
  const EditProfile3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 21.0,
                color: Colors.black,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.edittUpdateProfile,
                style: context.customFont(
                    'Open Sans', 23.0, FontWeight.w700, AppColors.themeColor),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.010,
              ),
              IconButton(
                  onPressed: () {
                    //  Navigator.pop(context);
                  },
                  icon: Image.asset(AssetsRes.edit,
                      height: MediaQuery.of(context).size.height * 0.047,
                      width: MediaQuery.of(context).size.width * 0.047,
                      fit: BoxFit.contain)),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.155,
              ),
              Text(
                AppStrings.addYourLoc,
                style: context.customFont(
                    'Open Sans', 24.0, FontWeight.w600, AppColors.black1),
              ),
              Gap(10),
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
                onTap: () {
                  Navigator.pushNamed(context, Routes.dashbaord);
                },
                height: MediaQuery.of(context).size.height * 0.060,
                width: MediaQuery.of(context).size.width,
                text: AppStrings.loctext,
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
                  Navigator.pushNamed(context, Routes.editProfile4);
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
        ),
      ),
    );
  }
}
