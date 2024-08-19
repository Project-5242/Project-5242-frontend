import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageContent(BuildContext context) {
    return [
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG3),
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG3),
      _onboardingComp(
          context: context,
          title: AppStrings.onboardtitle,
          description: AppStrings.onboardSubText,
          img: AssetsRes.ONBOARDING_IMG3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                      debugPrint("pageIndex:${_currentPage}");
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _buildPageContent(context)[index];
                  },
                ),
              ),
              _currentPage == 2
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 19),
                        textStyle: TextStyle(
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 18),
                      ),
                      onPressed: () {
                        context
                            .pushNamedAndRemoveUntil(Routes.selectRoleScreen);
                      },
                      child: Text(
                        AppStrings.getStarted,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        16),
                          ),
                          onPressed: () {},
                          child: Text(
                            AppStrings.skip,
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List<Widget>.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 8,
                                width: _currentPage == index ? 30 : 10,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? AppColors.blue
                                      : AppColors.grey,
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
                            if (_currentPage < 2) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {}
                          },
                          child: Text(
                            _currentPage < 2
                                ? AppStrings.next
                                : AppStrings.next,
                            style: TextStyle(
                                color: AppColors.grey,
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
  }
}

Widget _onboardingComp({
  required BuildContext context,
  required String title,
  required String description,
  required String img,
}) {
  return Container(
    child: Column(
      children: [
        Image.asset(img),
        const SizedBox(
          height: 57,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        Container(
          margin: const EdgeInsets.only(top: 103),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            description,
            style: TextStyle(
                color: AppColors.grey2,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
