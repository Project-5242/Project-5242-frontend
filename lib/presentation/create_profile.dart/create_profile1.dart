import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/create_profile.dart/create_profile2.dart';
import 'package:flutter_project/presentation/create_profile.dart/static_profile.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../home/home_view.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';

class CreateProfile1 extends StatefulWidget {
  const CreateProfile1({super.key});

  @override
  State<CreateProfile1> createState() => _CreateProfile1State();
}

class _CreateProfile1State extends State<CreateProfile1> {
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
      middleContentBuilder: () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addYoueSubNode1,
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
          // AppButton(

          //   //title: AppStrings.email,
          //  .. borderSideColor: AppColors.greyLight,
          //   hint:
          //   fillColor: AppColors.textFill,
          // ),

          AppButton(
            color: AppColors.white,
            color1: AppColors.grey,
            onTap: () => _picker,
            width: MediaQuery.of(context).size.width * 0.400,
            height: MediaQuery.of(context).size.height * 0.1,
            text: AppStrings.addImages,
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
                MaterialPageRoute(builder: (context) => CreateProfile2())),
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
