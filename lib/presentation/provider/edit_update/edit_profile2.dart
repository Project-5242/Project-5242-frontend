import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/widgets/app_profile.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/responsive_view.dart';
import '../../home/dashboard.dart';

import '../../../routes/routes.dart';
import '../../widgets/desktop_create_profile.dart';

class EditProfile2 extends StatefulWidget {
  const EditProfile2({super.key});

  @override
  State<EditProfile2> createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileTopview(context),
      tablet: _mobileTopview(context),
      desktop: _deskTopview(context),
    );
  }

  _mobileTopview(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    AppProfile(
      onTap1: () {
        Navigator.pushNamed(context, Routes.dashbaord);
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

  _deskTopview(BuildContext context) {
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
                      ;
                    },
                    onTap2: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.editProfile3);
                      }
                      ;
                    },
                    nodeText: AppStrings.addYoueSubNode2,
                    loremText: AppStrings.lorem),
              )),
        ),
      ),
    );
  }
}
