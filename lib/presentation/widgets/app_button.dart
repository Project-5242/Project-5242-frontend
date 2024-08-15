import 'package:flutter/material.dart';

import 'package:flutter_project/base/base.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final ShapeBorder? shape;
  final Color? textColor;
  final Color? backgroundColor;
  final String? title;
  final double? radius;
  final TextStyle? style;
  const AppButton({
    super.key,
    required this.height,
    required this.width,
    this.shape,
    required this.onPressed,
    this.textColor,
    this.title,
    this.style,
    this.backgroundColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
      onPressed: onPressed,
      color: backgroundColor,
      child: Text(
        title ?? "",
        style: style ??
            TextStyle(
              fontFamily: Fonts.fontsOpenSans,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: textColor ?? AppColors.white,
            ),
      ),
    );
  }
}
