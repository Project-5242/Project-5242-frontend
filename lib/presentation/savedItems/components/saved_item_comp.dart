import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';

class SavedItemComp extends StatelessWidget {
  const SavedItemComp({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.0,
        mainAxisExtent: 190,
        mainAxisSpacing: 30.0,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(7, 10, 0, 15),
          width: 167,
          decoration: BoxDecoration(
            color: AppColors.grey,
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
                    menuPadding: const EdgeInsets.all(8),
                    onSelected: (value) {
                      // Handle menu item selection
                      if (value == 1) {
                        // View Profile logic
                      } else if (value == 2) {
                        // Remove Profile logic
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        padding: const EdgeInsets.all(0),
                        value: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                                double.infinity, 20), // Button width and height
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: AppColors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        padding: const EdgeInsets.all(0),
                        value: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Remove Profile action
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 20),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: AppColors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                    "User Name",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Work 10 hrs",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AssetsRes.LOCATION_ICON),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                            color: AppColors.white,
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
  }
}
