import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

import '../../../routes/routes.dart';
import 'components/bar_chart.dart';

class TotalNodeView extends StatelessWidget {
  const TotalNodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _mobileView(context),
      desktop: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.menuView);
                  },
                  child: Image.asset(
                    AssetsRes.MENU_ICON,
                    height: 25,
                    width: 25,
                  ),
                ),
                const Gap(15),
                Text(
                  AppStrings.dashboard,
                  style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            Image.asset(
              AssetsRes.ARROW,
              height: 25,
              width: 25,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: responsive.isTablet
            ? const EdgeInsets.symmetric(horizontal: 100, vertical: 30)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const SizedBox(height: 117),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.540,
            height: MediaQuery.of(context).size.height * .650,
            child: BarChartSample(),
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalNode,
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "1058",
                style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.cyan),
              ),
              Row(
                children: [
                  Text(
                    "+30.1%",
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.normal, color: AppColors.green),
                  ),
                  Image.asset(
                    AssetsRes.INCREASEPERSENTAGE,
                    height: 33.54,
                    width: 27.14,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 87),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.dashBoard1);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AssetsRes.PREVIOUSE, width: 30, height: 24),
                    const Gap(11),
                    Text(
                      AppStrings.previous,
                      style: context.titleMedium
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.savedNodeView);
                  },
                  child: Row(
                    children: [
                      Text(
                        AppStrings.next,
                        style: context.titleMedium
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap(11),
                      Image.asset(
                        AssetsRes.NEXT,
                        width: 30,
                        height: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.dashboard,
              style: context.titleLarge.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black),
            ),
            Image.asset(
              AssetsRes.ARROW,
              height: MediaQuery.of(context).size.height * 0.025,
              width: MediaQuery.of(context).size.width * 0.025,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.030,
        ),
        Row(
          children: [
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.800,
                width: MediaQuery.of(context).size.width * 0.350,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                        spreadRadius: 0,
                      ),
                    ],
                    border: Border.all(
                        width: 1.0, color: AppColors.black.withOpacity(0.25))),
                child: _nodeWidget(context, AppStrings.totalnodeText,
                    AppStrings.totalNode, AppStrings.percentageText1),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.050,
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.800,
                width: MediaQuery.of(context).size.width * 0.350,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                        spreadRadius: 0,
                      ),
                    ],
                    border: Border.all(
                        width: 1.0, color: AppColors.black.withOpacity(0.25))),
                child: _nodeWidget(context, AppStrings.savednodeText,
                    AppStrings.savedNode, AppStrings.percentageText2),
              ),
            )
          ],
        )
      ]),
    ));
  }

  _nodeWidget(BuildContext context, String text1, String nodetxt,
      String percentagetxt) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.020),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.450,
          width: MediaQuery.of(context).size.width * 0.350,
          child: BarChartSample(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.074),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nodetxt,
              style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              text1,
              style: context.titleLarge
                  .copyWith(fontWeight: FontWeight.bold, color: AppColors.cyan),
            ),
            Row(
              children: [
                Text(
                  percentagetxt,
                  style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.normal, color: AppColors.green),
                ),
                Image.asset(
                  AssetsRes.INCREASEPERSENTAGE,
                  height: 33.54,
                  width: 27.14,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.067),
        InkWell(
          onTap: () {
            //   Navigator.pushNamed(context, Routes.dashBoard1);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AssetsRes.PREVIOUSE,
                      width: MediaQuery.of(context).size.width * 0.034,
                      height: MediaQuery.of(context).size.height * 0.024),
                  const Gap(11),
                  Text(
                    AppStrings.previous,
                    style: context.titleMedium
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, Routes.savedNodeView);
                },
                child: Row(
                  children: [
                    Text(
                      AppStrings.next,
                      style: context.titleMedium
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(11),
                    Image.asset(AssetsRes.NEXT,
                        width: MediaQuery.of(context).size.width * 0.034,
                        height: MediaQuery.of(context).size.height * 0.024),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
