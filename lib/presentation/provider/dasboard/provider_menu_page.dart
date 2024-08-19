import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

import '../../../routes/routes.dart';

class ProviderMenuPage extends StatelessWidget {
  const ProviderMenuPage({super.key});

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
                Image.asset(
                  AssetsRes.MENU_ICON,
                  height: 25,
                  width: 25,
                ),
                const Gap(15),
                Text(
                  AppStrings.menu,
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
          const SizedBox(height: 36),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.dashBoard1);
              },
              child: Row(
                children: [
                  Image.asset(
                    AssetsRes.DASHBOARD,
                    height: 20,
                    width: 20,
                  ),
                  const Gap(10),
                  Text(
                    AppStrings.dashboard,
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                ],
              )),
          const SizedBox(height: 33),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.createProfile);
            },
            child: Row(
              children: [
                Image.asset(
                  AssetsRes.PROFILE,
                  height: 20,
                  width: 20,
                ),
                const Gap(10),
                Text(
                  AppStrings.createProfile,
                  style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 33),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.profileView);
            },
            child: Row(
              children: [
                Image.asset(
                  AssetsRes.PROFILE,
                  height: 20,
                  width: 20,
                ),
                const Gap(10),
                Text(
                  AppStrings.profile,
                  style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
