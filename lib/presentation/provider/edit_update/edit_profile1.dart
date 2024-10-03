import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/widgets/desktop_create_profile.dart';

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
  final TextEditingController controller4 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _mobileView(context),
      desktop: _deskTopview(),
    );
  }

  _mobileView(BuildContext context) {
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

  _deskTopview() {
    final responsive = ResponsiveCheck(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0),
              ],
              border: Border.all(
                  width: 1.0, color: AppColors.black1.withOpacity(0.25))),
          height: responsive.isTablet
              ? MediaQuery.of(context).size.height * 0.800
              : MediaQuery.of(context).size.height * 0.800,
          width: responsive.isTablet
              ? MediaQuery.of(context).size.width * 0.700
              : MediaQuery.of(context).size.width * 0.500,
          child: Padding(
              padding: responsive.isTablet
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Form(
                key: formKey,
                child: DesktopCreateProfile(
                    text1: AppStrings.abc,
                    text1Controller: controller1,
                    text2Controller: controller2,
                    text4Controller: controller3,
                    text3Controller: controller4,
                    text2: AppStrings.lorem1,
                    text3: AppStrings.loremtxt,
                    text4: AppStrings.addImages,
                    onTap1: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.dashbaord);
                      }
                    },
                    onTap2: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.editProfile2);
                      }
                    },
                    nodeText: AppStrings.addYoueSubNode1,
                    loremText: AppStrings.lorem),
              )),
        ),
      ),
    );
  }
}
