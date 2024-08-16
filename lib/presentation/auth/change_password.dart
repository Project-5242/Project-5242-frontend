import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/presentation/widgets/app_rich_text.dart';
import 'package:flutter_project/presentation/widgets/custom_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/constants/app_string.dart';
import '../../res/assets_res.dart';
import '../../routes/routes.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  final Widget midleWidget;
  const ChangePasswordScreen({super.key, required this.midleWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return Scaffold(
        appBar: AppBar(
          leading: isDesktop
              ? null
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 21.0,
                    color: Colors.black,
                  )),
          title: isDesktop
              ? const Text(
                  textAlign: TextAlign.left,
                  AppStrings.forgetPassword,
                )
              : const Text(
                  AppStrings.changePassword,
                ),
          automaticallyImplyLeading: isDesktop ? false : true,
          centerTitle: isDesktop ? false : true,
        ),
        body: midleWidget,
      );
    }));
  }
}
