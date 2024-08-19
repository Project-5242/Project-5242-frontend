import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/provider/dasboard/components/bar_chart.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

import '../../../routes/routes.dart';

class Dashboard1Page extends StatelessWidget {
  const Dashboard1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
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
            ? const EdgeInsets.symmetric(horizontal: 30, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const SizedBox(height: 36),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.3,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.totalNodeView);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.totalNode,
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text(
                          "1058",
                          style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0B8FAC)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.3,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.savedNodeView);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.savedNode,
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Gap(6),
                        Text(
                          "344",
                          style: context.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0B8FAC)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 127),
          Image.asset(
            AssetsRes.GRAPH,
          ),
          const SizedBox(height: 30),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newNode,
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.250,
              ),
              Text(
                AppStrings.dashboardText,
                style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0B8FAC)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.190,
              ),
              Text(
                AppStrings.percentageText,
                style: context.titleSmall.copyWith(
                    fontWeight: FontWeight.normal, color: AppColors.green1),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.010,
              ),
              Image.asset(
                AssetsRes.INCREASEPERSENTAGE,
                height: MediaQuery.of(context).size.height * 0.050,
                width: MediaQuery.of(context).size.width * 0.050,
              ),
            ],
          )
        ],
      ),
    );
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
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
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.100,
              ),
              Row(children: [
                // SizedBox(

                //   child:
                //   //BarChartSample(),
                // ),
                Image.asset(
                  width: MediaQuery.of(context).size.width * 0.540,
                  height: MediaQuery.of(context).size.height * .650,
                  fit: BoxFit.contain,
                  AssetsRes.GRAPH,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.061,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.200,
                          width: MediaQuery.of(context).size.width * .131,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.totalNodeView);
                            },
                            child: Card(
                              elevation: 5,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.totalNode,
                                      style: context.titleMedium.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Gap(6),
                                    Text(
                                      "1058",
                                      style: context.titleLarge.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF0B8FAC)),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.026,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.200,
                          width: MediaQuery.of(context).size.width * .131,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.savedNodeView);
                            },
                            child: Card(
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.savedNode,
                                    style: context.titleMedium
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(6),
                                  Text(
                                    "344",
                                    style: context.titleLarge.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF0B8FAC)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.newNode,
                            style: context.titleMedium
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.050,
                          ),
                          Text(
                            AppStrings.dashboardText,
                            style: context.titleLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0B8FAC)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.090,
                          ),
                          Text(
                            AppStrings.percentageText,
                            style: context.titleSmall.copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.green1),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.010,
                          ),
                          Image.asset(
                            AssetsRes.INCREASEPERSENTAGE,
                            height: MediaQuery.of(context).size.height * 0.050,
                            width: MediaQuery.of(context).size.width * 0.050,
                          ),
                        ],
                      )
                    ]),
              ]),
            ])));
  }
}
