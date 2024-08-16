import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile2.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/static_profile.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';
import '../../home/home_view.dart';
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

  @override
  Widget build(BuildContext context) {
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
                if (formKey.currentState!.validate())
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
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
                if (formKey.currentState!.validate())
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfile2(
                                currentIndex: 1,
                                totalSteps: 3,
                              )));
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
}
