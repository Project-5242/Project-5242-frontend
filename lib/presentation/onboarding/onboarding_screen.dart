import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/OnboardingProvider.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:provider/provider.dart';

import '../../data/constants/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, onboardingProvider, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: PageController(
                        initialPage: onboardingProvider.currentPage,
                      ),
                      onPageChanged: (int page) {
                        onboardingProvider.currentPage = page;
                        debugPrint("pageIndex:$page");
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _buildPageContent(context)[index];
                      },
                    ),
                  ),
                  onboardingProvider.currentPage == 2
                      ? ElevatedButton(
                          onPressed: () {
                            onboardingProvider.completeOnboarding();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            minimumSize: const Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              AppStrings.getStarted,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            16),
                              ),
                              onPressed: () {
                                onboardingProvider.completeOnboarding();
                              },
                              child: const Text(
                                AppStrings.skip,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List<Widget>.generate(3, (index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: 8,
                                    width:
                                        onboardingProvider.currentPage == index
                                            ? 10
                                            : 10,
                                    decoration: BoxDecoration(
                                      color: onboardingProvider.currentPage ==
                                              index
                                          ? AppColors.blue
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            16),
                              ),
                              onPressed: () {
                                if (onboardingProvider.currentPage < 2) {
                                  onboardingProvider.currentPage++;
                                }
                              },
                              child: const Text(
                                AppStrings.next,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPageContent(BuildContext context) {
    return [
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG1),
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG2),
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG3),
    ];
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
      const SizedBox(height: 50),
      Image.asset(img),
      const SizedBox(height: 20),
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
      ),
      Container(
        margin: const EdgeInsets.only(top: 103),
        width: MediaQuery.of(context).size.width * 0.7,
        child: Text(
          description,
          style: const TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
