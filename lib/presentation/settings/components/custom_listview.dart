import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class CustomListView extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final void Function()? onPressed;
  const CustomListView({
    super.key,
    this.title,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              fontFamily: Fonts.fontsOpenSans,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          SizedBox(
            child: onPressed != null
                ? InkWell(
                    onTap: onPressed,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.iconColor,
                    ),
                  )
                : trailing,
          )
        ],
      ),
    );
  }
}


// ListTile(
//       contentPadding: EdgeInsets.zero,
//       title: Text(
//         title ?? "",
//         style: TextStyle(
//           fontFamily: Fonts.fontsOpenSans,
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           color: AppColors.textColor,
//         ),
//       ),
//       trailing: onPressed != null
//           ? IconButton(
//               icon: Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 size: 16,
//                 color: AppColors.iconColor,
//               ),
//               onPressed: onPressed,
//             )
//           : trailing,)