import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile1.dart';

import '../../../base/extensions/text_style_extensions.dart';
import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';
import '../../../data/constants/responsive_view.dart';
import '../../widgets/custom_button.dart';

class CreateProfile extends StatelessWidget {
  final String? roleType;

  const CreateProfile({super.key, this.roleType});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProfile1(),
                    ),
                  ),
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
                    style: context.customFont(
                        'Open Sans', 22.0, FontWeight.w600, AppColors.black),
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
                  style: context.customFont(
                      'Open Sans', 30.0, FontWeight.w700, AppColors.themeColor),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.173,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProfile1(),
                    ),
                  );
                },
                height: MediaQuery.of(context).size.height * 0.080,
                width: MediaQuery.of(context).size.width * 0.400,
                text: AppStrings.continueText,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
