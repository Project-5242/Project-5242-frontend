import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/auth/sign_up.dart';

class ModeSelectionScreen extends StatelessWidget {
  final String? type;
  const ModeSelectionScreen({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60, left: 36, right: 36),
        child: Column(
          children: [
            type == "user"
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUp(
                      roleType: type,
                    ),
                  ),
                );
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
                backgroundColor: AppColors.blue,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
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
