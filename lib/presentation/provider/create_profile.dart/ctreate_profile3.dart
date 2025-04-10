import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/CreateNodeProvider.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/addressProvider.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/MapScreen/AutoCompleteScreen.dart';
import 'package:provider/provider.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_string.dart';
import '../../../routes/routes.dart';
import '../../home/dashboard.dart';
import '../../widgets/custom_button.dart';
import 'static_profile.dart';

class CreateProfile3 extends StatefulWidget {
  final int? currentIndex;
  final int? totalSteps;
  final String? title;
  final String? description;

  final bool isEditMode;
  const CreateProfile3(
      {super.key,
      this.currentIndex,
      this.totalSteps,
      this.description,
      this.title,
      this.isEditMode = false});

  @override
  State<CreateProfile3> createState() => _CreateProfile3State();
}

class _CreateProfile3State extends State<CreateProfile3> {
  final int totalSteps = 3;

  void _nextStep() {
    if (currentIndex < totalSteps - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousStep() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();

    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
      final isEdit = widget.isEditMode;
      return StaticProfileLayout(
        currentIndex: 2,
        totalSteps: 3,
        middleContentBuilder: () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.066,
            ),
            Text(
              AppStrings.addYourLoc,
              style: context.customFont(
                  'Open Sans', 24.0, FontWeight.w600, AppColors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.030,
            ),
            Text(
              AppStrings.lorem,
              style: context.customFont('Open Sans', 19.0, FontWeight.w400,
                  AppColors.black.withOpacity(0.3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.113,
            ),
            // CustomButton(
            //   color: AppColors.white,
            //   color1: AppColors.themeColor,
            //   onTap: () {
            //     addressProvider.getGeoLocationPosition();
            //   },
            //   height: MediaQuery.of(context).size.height * 0.060,
            //   width: MediaQuery.of(context).size.width,
            //   text: AppStrings.allowCurrentloc,
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.034,
            // ),
            CustomButton(
              color: AppColors.white,
              color1: AppColors.themeColor,
              onTap: () async {
                final place = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AutoCompleteScreen()),
                );
                if (place != null) {
                  final address = place['address'];
                  final latitude = place['latitude'];
                  final longitude = place['longitude'];

                  print("Selected Address: $address");
                  print("Latitude: $latitude");
                  print("Longitude: $longitude");

                  addressProvider.setAddressDetails(
                      address, latitude, longitude);
                  Navigator.pushNamed(context, Routes.createProfile4);
                }
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: AppStrings.addMannually,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.165,
            ),
            CustomButton(
              onTap: () {
                if (widget.isEditMode) {
                  // Handle edit logic
                } else {
                  context.read<CreateNodeProvider>().callCreateNodeApi(
                      context: context,
                      title: widget.title.toString(),
                      description: widget.description.toString(),
                      address: addressProvider.fullAddress,
                      lat: addressProvider.latitude,
                      long: addressProvider.longitude);
                }
              },
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width,
              text: widget.isEditMode ? AppStrings.save : AppStrings.next,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
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
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
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
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: AppColors.themeColor,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        _previousStep;
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      '3/${totalSteps}',
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                LinearProgressIndicator(
                  value: 3 / totalSteps,
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(4),
                  minHeight: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                Text(
                  AppStrings.addYourLoc,
                  style: context.customFont(
                      'Open Sans', 24.0, FontWeight.w600, AppColors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
                Text(
                  AppStrings.lorem,
                  style: context.customFont('Open Sans', 19.0, FontWeight.w400,
                      AppColors.black.withOpacity(0.3)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.070,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      color: AppColors.white,
                      color1: AppColors.themeColor,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashbaordWidget())),
                      height: MediaQuery.of(context).size.height * 0.100,
                      width: MediaQuery.of(context).size.width * 0.210,
                      text: AppStrings.allowCurrentloc,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.010,
                    ),
                    CustomButton(
                      color: AppColors.white,
                      color1: AppColors.themeColor,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.dashbaord);
                      },
                      height: MediaQuery.of(context).size.height * 0.100,
                      width: MediaQuery.of(context).size.width * 0.210,
                      text: AppStrings.addMannually,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.070,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.createProfile4);
                  },
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.200,
                  text: AppStrings.next,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
