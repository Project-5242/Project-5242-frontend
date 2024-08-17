import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile2.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/static_profile.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';

import '../../../data/constants/responsive_view.dart';
import '../../home/dashboard.dart';
import '../../../routes/routes.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field_widget.dart';
import '../../widgets/custom_button.dart';

class CreateProfile1 extends StatefulWidget {
  const CreateProfile1({super.key});

  @override
  State<CreateProfile1> createState() => _CreateProfile1State();
}

class _CreateProfile1State extends State<CreateProfile1> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    return StaticProfileLayout(
      currentIndex: 0,
      totalSteps: 3,
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.addYoueSubNode1,
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
              height: MediaQuery.of(context).size.height * 0.010,
            ),
            AppTextFieldWidget(
              controller: hoursController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cant be empty';
                }
                return null;
              },
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
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cant be empty';
                }
                return null;
              },
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
              controller: descController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cant be empty';
                }
                return null;
              },
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
            Container(
              width: MediaQuery.of(context).size.width * 0.400,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.grey, width: 1.0)),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: _selectedImage != null
                      ? Image.file(
                          File(_selectedImage!.path),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Text(
                            AppStrings.addImages,
                            style: context.customFont('Open Sans', 20.0,
                                FontWeight.w400, AppColors.grey),
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            CustomButton(
              color: AppColors.white,
              color1: AppColors.themeColor,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, Routes.dashbaord);
                }
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: AppStrings.addMore,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, Routes.createProfile2);
                }
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
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                : const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                      '${currentIndex + 1}/${totalSteps}',
                      style: TextStyle(
                        color: AppColors.black1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                LinearProgressIndicator(
                  value: (currentIndex + 1) / totalSteps,
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(4),
                  minHeight: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                Text(
                  AppStrings.addYoueSubNode1,
                  style: context.customFont(
                      'Open Sans', 24.0, FontWeight.w600, AppColors.black1),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Text(
                  AppStrings.lorem,
                  style: context.customFont('Open Sans', 19.0, FontWeight.w400,
                      AppColors.black1.withOpacity(0.3)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
                Row(
                  children: [
                    Flexible(
                      child: AppTextFieldWidget(
                        textAlign: TextAlign.center,
                        controller: hoursController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cant be empty';
                          }
                          return null;
                        },
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
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.028,
                    ),
                    Flexible(
                      child: AppTextFieldWidget(
                        textAlign: TextAlign.center,
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cant be empty';
                          }
                          return null;
                        },
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
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cant be empty';
                          }
                          return null;
                        },
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
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.028,
                    ),
                    Flexible(
                      child: AppTextFieldWidget(
                        textAlign: TextAlign.center,
                        controller: descController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cant be empty';
                          }
                          return null;
                        },
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
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, Routes.dashbaord);
                          }
                        },
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
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, Routes.createProfile2);
                          }
                        },
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
            ),
          ),
        ),
      ),
    );
  }
}
