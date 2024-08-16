import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final String? description;
  final void Function()? onTap;
  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      onTap: onTap,
      title: Text(
        title ?? "",
        style: TextStyle(
          fontFamily: Fonts.fontsOpenSans,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
        ),
      ),
      subtitle: Text(
        description ?? "",
        style: TextStyle(
          fontFamily: Fonts.fontsOpenSans,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textgreyColor,
        ),
      ),
    );
  }
}
