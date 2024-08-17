import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile1.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';

import '../../../data/constants/responsive_view.dart';
import '../../../routes/routes.dart';
import '../../widgets/app_button.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final response = ResponsiveCheck(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppStrings.readyCreateProfile,
                    style: context.customFont('Open Sans', 26.0,
                        FontWeight.w700, AppColors.themeColor),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.335,
                ),
                CustomButton(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.createProfile1),
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width,
                  text: AppStrings.continueText,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                ),
              ]),
        ),
      ),
    );
  }

  _deskTopView(BuildContext context) {
    final response = ResponsiveCheck(context);
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          AppStrings.createProfile,
                          style: context.customFont('Open Sans', 22.0,
                              FontWeight.w600, AppColors.black1),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_right_alt,
                            color: AppColors.themeColor,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.242,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.readyCreateProfile1,
                        style: context.customFont('Open Sans', 30.0,
                            FontWeight.w700, AppColors.themeColor),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.173,
                    ),
                    CustomButton(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.createProfile4),
                      height: MediaQuery.of(context).size.height * 0.080,
                      width: MediaQuery.of(context).size.width * 0.400,
                      text: AppStrings.continueText,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                  ],
                ))));
  }
}
