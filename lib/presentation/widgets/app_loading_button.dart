import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class AppLoadingButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? tittleColor;

  const AppLoadingButton(
      {super.key,
      this.title,
      this.onTap,
      this.height,
      this.width,
      this.padding,
      this.textStyle,
      this.backgroundColor,
      this.tittleColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.theme.primaryColor,
          textStyle: textStyle ??
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          fixedSize: Size(width ?? 200, height ?? 50),
          foregroundColor: tittleColor ?? Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
