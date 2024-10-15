import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../AppProvider/ScreenProvider/DetailsProvider.dart';

class SavedItemComp extends StatefulWidget {
  const SavedItemComp({super.key});

  @override
  State<SavedItemComp> createState() => _SavedItemCompState();
}

class _SavedItemCompState extends State<SavedItemComp> {
  @override
  void initState() {
    // TODO: implement
    Future.delayed(Duration.zero, () {
      context.read<DetailsProvider>().callAllSaveNodeListApi(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);
    return Consumer<DetailsProvider>(builder: (context, value, child) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: response.isMobile || response.isTablet
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25.0,
                    mainAxisExtent: 190,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 0.7,
                  )
                : const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 47.0,
                    crossAxisSpacing: 42.0,
                    childAspectRatio: 2 / 3,
                  ),
            padding: response.isMobile || response.isTablet
                ? const EdgeInsets.symmetric(vertical: 50, horizontal: 20)
                : const EdgeInsets.fromLTRB(65, 100, 95, 50),
            itemCount: value.saveNodeData.length,
            itemBuilder: (context, index) {
              var data = value.saveNodeData[index];
              return Container(
                padding: const EdgeInsets.fromLTRB(7, 10, 0, 15),
                decoration: BoxDecoration(
                  color: AppColors.textFill,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton<int>(
                          color: AppColors.white,
                          padding: const EdgeInsets.all(8),
                          onSelected: (value) {
                            if (value == 1) {
                              // View Profile logic
                            } else if (value == 2) {
                              // Remove Profile logic
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem<int>(
                              padding: const EdgeInsets.all(8),
                              value: 1,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, Routes.userDetailScreen);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: AppColors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.blue,
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: Text(
                                  "View Profile",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            PopupMenuItem<int>(
                              padding: const EdgeInsets.all(8),
                              value: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle Remove Profile action
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: AppColors.blue),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.blue,
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: Text(
                                  "Remove Profile",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                          icon: SvgPicture.asset(AssetsRes.OPT_ICON),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.fullName ?? "User Name",
                          style: TextStyle(
                              color: response.isMobile || response.isTablet
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Work 10 hrs",
                          style: TextStyle(
                              color: response.isMobile || response.isTablet
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetsRes.LOCATION_ICON,
                              color: response.isMobile || response.isTablet
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                  color: response.isMobile || response.isTablet
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    });
  }
}
