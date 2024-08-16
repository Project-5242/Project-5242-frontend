import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_project/routes/routes.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var userType = arguments['userType'];
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60, left: 36, right: 36),
        child: Column(
          children: [
            userType == "user"
                ? _onboardingComp(
                    context: context,
                    title: AppStrings.user,
                    description: AppStrings.providerSubText,
                    img: AssetsRes.ONBOARDING_IMG3)
                : _onboardingComp(
                    context: context,
                    title: AppStrings.provider,
                    description: AppStrings.providerSubText,
                    img: AssetsRes.ONBOARDING_IMG3),
            //  Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white, // Dark teal color
                minimumSize:
                    const Size(double.infinity, 60), // Button width and height
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.userDetailScreen);
              },
              child: Text(
                AppStrings.signUp,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue, // Dark teal color
                minimumSize:
                    const Size(double.infinity, 60), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginScreen);
              },
              child: Text(
                AppStrings.login,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

Widget _onboardingComp({
  required BuildContext context,
  required String title,
  required String description,
  required String img,
}) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: AppColors.black, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      Container(
        margin: const EdgeInsets.only(top: 23, bottom: 62),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          description,
          style: TextStyle(
              color: AppColors.grey2,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
      Image.asset(img),
      const SizedBox(
        height: 60,
      ),
    ],
  );
}
