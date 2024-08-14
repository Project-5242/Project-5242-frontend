import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/create_profile.dart/create_profile1.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_string.dart';
import '../home/home_view.dart';
import '../widgets/app_button.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
                AppButton(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateProfile1())),
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
}
