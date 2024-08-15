import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile3.dart';
import 'package:flutter_project/presentation/widgets/app_profile.dart';

import '../../../routes/routes.dart';
import '../../home/home_view.dart';

class EditProfile2 extends StatefulWidget {
  const EditProfile2({super.key});

  @override
  State<EditProfile2> createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppProfile(
      onTap1: () {
        Navigator.pushNamed(context, Routes.homeScreen);
      },
      onTap2: () {
        Navigator.pushNamed(context, Routes.editProfile3);
      },
      text1: AppStrings.addYoueSubNode2,
      text2: AppStrings.loginSubTitle,
      text3: AppStrings.pqr,
      text4: AppStrings.lorem2,
      text5: AppStrings.loremtxt,
      text6: AppStrings.addImages,
      text7: AppStrings.addMore,
      text8: AppStrings.next,
      controller1: controller1,
      controller3: controller3,
      controller2: controller2,
    );
  }
}
