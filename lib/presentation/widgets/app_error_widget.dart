import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets_res.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AssetsRes.ERROR_LOTTIE, repeat: false),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Something went wrong",
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
