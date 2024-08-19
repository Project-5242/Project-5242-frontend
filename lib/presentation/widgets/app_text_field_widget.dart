import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';

import '../../data/constants/responsive_view.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool menditry;
  final int? lines;
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
    this.lines,
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
        Text(
          title ?? '',
          style: context.customFont(
              'Open Sans', 14.0, FontWeight.w600, AppColors.black),
        ),
        const SizedBox(
          height: 06,
        ),

        TextFormField(
          controller: controller,
          keyboardType: inputType,
          readOnly: readOnly,
          onTap: onTap,
          cursorColor: Colors.black,
          maxLines: password == true ? 1 : lines,
          obscureText: lines == null ? password == true : false,
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
            counterText: "",
            hintStyle: context.customFont(
                'Open Sans', 14.0, FontWeight.w400, AppColors.grey),
            // errorText: errorText,
            filled: true,
            fillColor: AppColors.greyLight.withOpacity(0.2),
            //  errorMaxLines: 2,
            prefixIcon: prefix,
            prefixIconColor: Theme.of(context).colorScheme.primary,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    width: 1.0, color: AppColors.greyLight.withOpacity(0.1))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1.0,
              ),
            ),
            suffixIconColor: Theme.of(context).colorScheme.primary,
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 10), // Ensure vertical centering
          ),
        ),
        //      ),
      ],
    );
  }

  String capitalize(String value) {
    if (value.trim().isEmpty) return "";
    return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }
}
