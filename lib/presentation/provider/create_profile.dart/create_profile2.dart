import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/ctreate_profile3.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';
import '../../../routes/routes.dart';

import '../../widgets/app_text_field_widget.dart';
import 'static_profile.dart';

class CreateProfile2 extends StatefulWidget {
  final int currentIndex;
  final int totalSteps;
  const CreateProfile2(
      {super.key, required this.currentIndex, required this.totalSteps});

  @override
  State<CreateProfile2> createState() => _CreateProfile2State();
}

class _CreateProfile2State extends State<CreateProfile2> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.addYoueSubNode2,
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
                          width: MediaQuery.of(context).size.width * 0.400,
                          height: MediaQuery.of(context).size.height * 0.1,
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
                  Navigator.pushNamed(context, Routes.homeScreen);
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
                  Navigator.pushNamed(context, Routes.createProfile3);
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
      currentIndex: widget.currentIndex,
      totalSteps: widget.totalSteps,
    );
  }
}
