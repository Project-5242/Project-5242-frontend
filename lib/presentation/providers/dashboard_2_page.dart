import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

class Dashboard2Page extends StatelessWidget {
  const Dashboard2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          const SizedBox(height: 117),
          Image.asset(
            AssetsRes.GRAPH,
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
                    fontWeight: FontWeight.bold,
                    color: AppColors.cyan),
              ),
              Row(
                children: [
                  Text(
                    "+30.1%",
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.green),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               children: [
                 Image.asset(
                     AssetsRes.PREVIOUSE,
                     width: 30,
                     height: 24
                 ),
                 const Gap(11),
                 Text(
                   AppStrings.next,
                   style:
                   context.titleMedium.copyWith(fontWeight: FontWeight.bold),
                 ),
               ],
             ),
              Row(
                children: [
                  Text(
                    AppStrings.previous,
                    style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Gap(11),
                  Image.asset(
                    AssetsRes.NEXT,
                    width: 30,
                    height: 24,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
