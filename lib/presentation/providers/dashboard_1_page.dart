import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
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
        children: const [
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 170,
                child: Card(
                  elevation: 5,
                  color: Colors.cyan,
                ),
              ),
              SizedBox(
                height: 100,
                width: 170,
                child: Card(
                  elevation: 5,
                  color: Colors.cyan,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
