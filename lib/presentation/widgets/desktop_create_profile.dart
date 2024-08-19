import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import 'app_text_field_widget.dart';
import 'custom_button.dart';

class DesktopCreateProfile extends StatelessWidget {
  final String? text1;
  final String? nodeText;
  final String? loremText;

  final TextEditingController? text1Controller;
  final TextEditingController? text2Controller;
  final TextEditingController? text4Controller;
  final TextEditingController? text3Controller;
  final String? text2;
  final String? text3;
  final String? text4;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  DesktopCreateProfile(
      {super.key,
      required this.text1,
      required this.text1Controller,
      required this.text2Controller,
      required this.text4Controller,
      required this.text3Controller,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.onTap1,
      required this.onTap2,
      required this.nodeText,
      required this.loremText});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return ListView(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            icon: Image.asset(AssetsRes.ic_edit),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.070,
        ),
        Text(
          nodeText ?? AppStrings.addYoueSubNode1,
          style: context.customFont(
              'Open Sans', 24.0, FontWeight.w600, AppColors.black),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.010,
        ),
        Text(
          loremText ?? AppStrings.lorem,
          style: context.customFont('Open Sans', 19.0, FontWeight.w400,
              AppColors.black.withOpacity(0.3)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.010,
        ),
        Row(
          children: [
            Flexible(
              child: AppTextFieldWidget(
                textAlign: TextAlign.center,
                controller: text1Controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cant be empty';
                  }
                  return null;
                },
                //title: AppStrings.email,
                borderSideColor: AppColors.greyLight,
                hint: text1 ?? '',
                hintStyle: context.customFont(
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.028,
            ),
            Flexible(
              child: AppTextFieldWidget(
                textAlign: TextAlign.center,
                controller: text2Controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cant be empty';
                  }
                  return null;
                },
                //title: AppStrings.email,
                borderSideColor: AppColors.greyLight,
                hint: text2 ?? '',
                hintStyle: context.customFont(
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.010,
        // ),
        Row(
          children: [
            Flexible(
              child: AppTextFieldWidget(
                textAlign: TextAlign.center,
                controller: text3Controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cant be empty';
                  }
                  return null;
                },
                //title: AppStrings.email,
                borderSideColor: AppColors.greyLight,
                hint: text3 ?? '',
                hintStyle: context.customFont(
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.028,
            ),
            Flexible(
              child: AppTextFieldWidget(
                textAlign: TextAlign.center,
                controller: text4Controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cant be empty';
                  }
                  return null;
                },
                //title: AppStrings.email,
                borderSideColor: AppColors.greyLight,
                hint: text4 ?? '',
                hintStyle: context.customFont(
                  'Open Sans',
                  18.0,
                  FontWeight.w400,
                  AppColors.grey,
                ),
                fillColor: AppColors.textFill,
              ),
              //  Container(
              //   width: MediaQuery.of(context).size.width * 0.300,
              //   height: MediaQuery.of(context).size.height * 0.080,
              //   decoration: BoxDecoration(
              //       color: AppColors.white,
              //       borderRadius: BorderRadius.circular(10.0),
              //       border:
              //           Border.all(color: AppColors.grey, width: 1.0)),
              //   child: Center(
              //     child: GestureDetector(
              //       onTap: () {
              //         _pickImage();
              //       },
              //       child: _selectedImage != null
              //           ? Image.file(
              //               File(_selectedImage!.path),
              //               fit: BoxFit.cover,
              //             )
              //           : Center(
              //               child: Text(
              //                 AppStrings.addImages,
              //                 style: context.customFont(
              //                     'Open Sans',
              //                     20.0,
              //                     FontWeight.w400,
              //                     AppColors.grey),
              //               ),
              //             ),
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.070,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: AppColors.white,
                color1: AppColors.themeColor,
                onTap: onTap1,
                // onTap: () {
                //   if (formKey.currentState!.validate()) {
                //     Navigator.pushNamed(context, Routes.dashbaord);
                //   }
                // },
                width: responsive.isTablet
                    ? MediaQuery.of(context).size.width * 0.300
                    : MediaQuery.of(context).size.width * 0.202,
                height: MediaQuery.of(context).size.height * 0.080,
                text: AppStrings.addMore,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.028,
              ),
              CustomButton(
                onTap: onTap2,
                // onTap: () {
                //   if (formKey.currentState!.validate()) {
                //     Navigator.pushNamed(context, Routes.createProfile2);
                //   }
                // },
                width: responsive.isTablet
                    ? MediaQuery.of(context).size.width * 0.300
                    : MediaQuery.of(context).size.width * 0.202,
                height: MediaQuery.of(context).size.height * 0.080,
                text: AppStrings.next,
              ),
            ],
          ),
        )
      ],
    );
  }
}
