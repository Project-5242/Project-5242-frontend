import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

import '../../data/constants/responsive_view.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final Color? color;
  final Color? color1;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.text,
    required this.onTap,
    this.color,
    this.color1,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);

    return InkWell(
        onTap: onTap,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color ?? AppColors.themeColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: color1 ?? AppColors.themeColor, width: 1.0)),
            child: Center(
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: responsive.isTablet
                    ? context.customFont('Open Sans', 17.0, FontWeight.w500,
                        color1 ?? AppColors.white)
                    : context.customFont('Open Sans', 18.0, FontWeight.w500,
                        color1 ?? AppColors.white),
              ),
            )));
  }
}
