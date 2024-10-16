import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  const CustomTextFormField(
      {super.key,
      this.title,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.controller,
      this.obscureText = false,
      this.readOnly = false,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontFamily: Fonts.fontsOpenSans,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 14,
                fontFamily: Fonts.fontsOpenSans,
                fontWeight: FontWeight.w400),
            fillColor: AppColors.textFieldBackgroundColor,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: AppColors.textFieldBorderColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: AppColors.textFieldBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: AppColors.textFieldBorderColor,
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
