import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:gap/gap.dart';

class Dashboard1Page extends StatelessWidget {
  const Dashboard1Page({super.key});

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
          const SizedBox(height: 36),
          Row(
            children: [
               SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.3,
                child:  Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.totalNode,
                        style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Gap(6),
                      Text(
                        "1058",
                        style: context.titleLarge.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF0B8FAC)),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width /2.3,
                child:  Card(
                  elevation: 5,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.savedNode,
                        style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap(6),
                      Text(
                        "344",
                        style: context.titleLarge.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF0B8FAC)),
                      ),
                    ],
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newNode,
                style: context.titleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "28",
                style: context.titleLarge.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF0B8FAC)),
              ),
              Image.asset(
                AssetsRes.INCREASEPERSENTAGE,
                height: 80,
                width: 80,
              ),
            ],
          )
        ],
      ),
    );
  }
}
