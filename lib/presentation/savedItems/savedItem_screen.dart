import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/savedItems/components/empty_comp.dart';
import 'package:flutter_project/presentation/savedItems/components/saved_item_comp.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart';

class SaveditemScreen extends StatefulWidget {
  const SaveditemScreen({super.key});

  @override
  State<SaveditemScreen> createState() => _SaveditemScreenState();
}

class _SaveditemScreenState extends State<SaveditemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS
            ? AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 21.0,
                      color: Colors.black,
                    )),
                title: Text(
                  AppStrings.savedItems,
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 26,
                      fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                actions: [
                  SvgPicture.asset(AssetsRes.NOTIFICATION_ICON),
                  const SizedBox(
                    width: 32,
                  )
                ],
              )
            : AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    )),
                title: Text(
                  AppStrings.savedItems,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
        body: const SavedItemComp());
  }
}
