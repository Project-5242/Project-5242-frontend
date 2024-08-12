import 'package:flutter_project/base/base.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets_res.dart';

class AppEmptyWidget extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  const AppEmptyWidget({super.key, this.text, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AssetsRes.EMPTY_LOTTIE,
              repeat: false, height: height, width: width),
          const SizedBox(
            height: 10,
          ),
          Text(
            text ?? "No Data",
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
