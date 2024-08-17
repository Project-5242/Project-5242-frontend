import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';

import 'package:flutter_project/presentation/provider/edit_update/edit_profile4.dart';
import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';
import '../../../data/constants/app_string.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_button.dart';

class EditProfile3 extends StatelessWidget {
  EditProfile3({
    super.key,
  });
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileTopview(context),
      tablet: _mobileTopview(context),
      desktop: _deskTopview(context),
    );
  }

  _mobileTopview(BuildContext context) {
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
                    'Open Sans', 24.0, FontWeight.w600, AppColors.black),
              ),
              const Gap(10),
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

  _deskTopview(BuildContext context) {
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
                          spreadRadius: 0),
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
                      ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                      : const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                  child: Form(
                      key: formKey,
                      child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    color: AppColors.themeColor,
                                    icon: Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Text(
                                    AppStrings.editUpdate,
                                    style: TextStyle(
                                      color: AppColors.themeColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  IconButton(
                                    // color: AppColors.themeColor,
                                    icon: Image.asset(AssetsRes.ic_edit),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ]),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                            ),
                            Text(
                              AppStrings.addYourLoc,
                              style: context.customFont('Open Sans', 24.0,
                                  FontWeight.w600, AppColors.black),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
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
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  color: AppColors.white,
                                  color1: AppColors.themeColor,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.dashbaord);
                                  },
                                  height: MediaQuery.of(context).size.height *
                                      0.100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.200,
                                  text: AppStrings.loctext,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.034,
                                ),
                                CustomButton(
                                  color: AppColors.white,
                                  color1: AppColors.themeColor,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.dashbaord);
                                  },
                                  height: MediaQuery.of(context).size.height *
                                      0.100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.200,
                                  text: AppStrings.addMannually,
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.150,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 120),
                              child: CustomButton(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.editProfile4);
                                },
                                height:
                                    MediaQuery.of(context).size.height * 0.080,
                                width:
                                    MediaQuery.of(context).size.width * 0.400,
                                text: AppStrings.next,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ])),
                ))));
  }
}
