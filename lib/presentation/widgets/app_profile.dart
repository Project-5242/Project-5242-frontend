import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';

import 'package:flutter_project/presentation/widgets/app_button.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/constants/app_string.dart';
import 'app_text_field_widget.dart';

class AppProfile extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final String text8;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;

  const AppProfile(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.text6,
      required this.text7,
      required this.text8,
      required this.onTap1,
      required this.onTap2,
      required this.controller1,
      required this.controller2,
      required this.controller3});

  @override
  State<AppProfile> createState() => _AppProfileState();
}

class _AppProfileState extends State<AppProfile> {
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
              IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.155,
                  ),
                  Text(
                    widget.text1,
                    //   AppStrings.addYoueSubNode1,
                    style: context.customFont(
                        'Open Sans', 24.0, FontWeight.w600, AppColors.black),
                  ),
                  Gap(10),
                  Text(
                    widget.text2,
                    //  AppStrings.lorem,
                    style: context.customFont('Open Sans', 19.0,
                        FontWeight.w400, AppColors.black.withOpacity(0.3)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  AppTextFieldWidget(
                    controller: widget.controller1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cant be empty';
                      }
                      return null;
                    },
                    //title: AppStrings.email,
                    borderSideColor: AppColors.greyLight,
                    hint: widget.text3,
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
                    controller: widget.controller2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cant be empty';
                      }
                      return null;
                    },
                    borderSideColor: AppColors.greyLight,
                    hint: widget.text4,
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
                    controller: widget.controller3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cant be empty';
                      }
                      return null;
                    },
                    borderSideColor: AppColors.greyLight,
                    hint: widget.text5,
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
                        child: IconButton(
                      onPressed: () {
                        _pickImage();
                      },
                      icon: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!.path),
                              width: MediaQuery.of(context).size.width * 0.400,
                              height: MediaQuery.of(context).size.height * 0.1,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image,
                              size: 60.0, color: AppColors.grey),
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  CustomButton(
                    color: AppColors.white,
                    color1: AppColors.themeColor,
                    onTap: widget.onTap1,
                    // onTap: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeView())),
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width,
                    text: widget.text7,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  CustomButton(
                    onTap: widget.onTap2,
                    height: MediaQuery.of(context).size.height * 0.060,
                    width: MediaQuery.of(context).size.width,
                    text: widget.text8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
