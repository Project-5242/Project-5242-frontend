import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';

import '../../data/constants/responsive_view.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool menditry;
  final int? maxLines;
  final Widget? titleWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final TextInputAction? action;
  final TextAlign? textAlign;
  final Widget? suffix;
  final bool? password;
  final double? vPadding;
  final EdgeInsetsGeometry? hPadding;
  final bool isExpanded;
  final Color? fillColor;
  final Color? borderSideColor;
  final double? sizedBoxWidth;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool? isMendotary;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool showClearButton;
  final bool showCharacterCount;
  final Duration animationDuration;
  final Curve animationCurve;

  final onSuffixTap;
  final bool? isDropDownShowing;
  final String? placeHolderText;
  final String? errorText;
  final Widget? prefix;
  final int? maxLength;
  final Function(bool)? onPrefixTap;
  final String? prefixText;
  final bool? editabled;
  final TextStyle? hintStyle;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Color? titleColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enableCopyPaste;
  final VoidCallback? onTap;
  final bool animation;
  const AppTextFieldWidget({
    super.key,
    this.title,
    this.animation = true,
    this.onTap,
    this.hint,
    this.vPadding,
    this.onChanged,
    this.maxLines,
    this.titleWidget,
    this.action,
    this.inputType,
    this.validator,
    this.password,
    this.suffix,
    this.inputFormatters,
    this.textAlign,
    this.sizedBoxWidth,
    this.fillColor,
    this.isExpanded = true,
    this.hPadding,
    this.borderSideColor,
    this.controller,
    this.focusNode,
    this.isMendotary,
    this.width,
    this.borderRadius = 8.0,
    this.showClearButton = true,
    this.showCharacterCount = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.onSuffixTap,
    this.isDropDownShowing = false,
    this.placeHolderText,
    this.errorText,
    this.prefix,
    this.maxLength,
    this.onPrefixTap,
    this.prefixText,
    this.editabled,
    this.readOnly = false,
    this.menditry = false,
    this.padding,
    this.titleColor,
    this.hintStyle,
    this.enableCopyPaste = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          duration: animationDuration,
          curve: animationCurve,
          opacity: controller?.text.isNotEmpty == true ? 1.0 : 0.8,
          child: Text(
            title ?? '',
            style: context.customFont(
                'Open Sans', 14.0, FontWeight.w600, AppColors.black),
          ),
        ),
        const SizedBox(
          height: 06,
        ),

        AnimatedContainer(
          duration: animationDuration,
          curve: animationCurve,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            boxShadow: [if (focusNode?.hasFocus == true) BoxShadow(
              color: (fillColor ?? AppColors.white).withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            readOnly: readOnly,
            onTap: onTap,
            cursorColor: Colors.black,
            maxLines: password == true ? 1 : maxLines,
            obscureText: maxLines == null ? password == true : false,
            validator: validator ?? validator,
            maxLength: maxLength,
            textAlign: textAlign ?? TextAlign.start,
            focusNode: focusNode,
            enabled: editabled ?? true,
            textInputAction: action ?? TextInputAction.done,
            textAlignVertical: TextAlignVertical.center,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            enableInteractiveSelection: enableCopyPaste ?? false,
            style: context.bodyMedium,
          decoration: InputDecoration(
            hintText: (hint ?? '').isNotEmpty ? capitalize(hint ?? '') : "",
            filled: true,
            fillColor: fillColor ?? AppColors.white,
            contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: borderSideColor ?? AppColors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: borderSideColor ?? AppColors.grey.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: suffix,
            prefixIcon: prefix,
            counterText: showCharacterCount ? null : "",
            errorStyle: TextStyle(color: Colors.red, fontSize: 12),
            hintStyle: hintStyle ?? TextStyle(color: AppColors.grey.withOpacity(0.7), fontSize: 14), // Ensure vertical centering
          ),
        ),
        //      ),
    )],
    );
  }

  String capitalize(String value) {
    if (value.trim().isEmpty) return "";
    return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }
}
