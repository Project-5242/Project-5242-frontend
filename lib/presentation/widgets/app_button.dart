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
  final double? elevation;
  final bool isLoading;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  
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
    this.elevation = 2,
    this.isLoading = false,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: backgroundColor,
        padding: padding,
        minimumSize: Size(width ?? 0, height ?? 0),
        // shape: shape ??
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(radius ?? 15),
        //     ),
        disabledBackgroundColor: backgroundColor?.withOpacity(0.6),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? AppColors.white),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[icon!, SizedBox(width: 8)],
                Text(
                  title ?? "",
                  style: style ??
                      TextStyle(
                        fontFamily: Fonts.fontsOpenSans,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? AppColors.white,
                      ),
                ),
              ],
            ),
    );
  }
}
