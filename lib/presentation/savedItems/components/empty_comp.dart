import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart';

class EmptyComp extends StatelessWidget {
  const EmptyComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsRes.FAV_ICON),
          Text(
            AppStrings.noItems,
            style: TextStyle(
                color: AppColors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: defaultTargetPlatform == TargetPlatform.android ||
                defaultTargetPlatform == TargetPlatform.iOS
            ?  MediaQuery.of(context).size.width:MediaQuery.of(context).size.width * 0.26,
            child: Text(AppStrings.noItemsSubText,
                style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
