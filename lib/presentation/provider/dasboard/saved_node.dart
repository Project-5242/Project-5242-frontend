import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

import '../../../routes/routes.dart';
import 'components/bar_chart.dart';

class SavedNodeView extends StatelessWidget {
  const SavedNodeView({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
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
                AppStrings.savedNode,
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "344",
                style: context.titleLarge.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.cyan),
              ),
              Row(
                children: [
                  Text(
                    "+18.1%",
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
              Navigator.pushNamed(context, Routes.totalNodeView);
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
                    Navigator.pushNamed(context, Routes.dashBoard1);
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
}
