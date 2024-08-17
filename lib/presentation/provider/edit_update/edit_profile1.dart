import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import '../../../data/constants/app_string.dart';
import '../../widgets/app_profile.dart';

class EditProfile1 extends StatefulWidget {
  const EditProfile1({super.key});

  @override
  State<EditProfile1> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppProfile(
      onTap1: () {
        Navigator.pushNamed(context, Routes.dashbaord);
      },
      onTap2: () {
        Navigator.pushNamed(context, Routes.editProfile2);
      },
      text1: AppStrings.addYoueSubNode1,
      text2: AppStrings.loginSubTitle,
      text3: AppStrings.abc,
      text4: AppStrings.lorem1,
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
