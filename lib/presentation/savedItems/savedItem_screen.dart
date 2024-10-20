import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/DetailsProvider.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/savedItems/components/saved_item_comp.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../notifications/notification_view.dart';

class SaveditemScreen extends StatefulWidget {
  const SaveditemScreen({super.key});

  @override
  State<SaveditemScreen> createState() => _SaveditemScreenState();
}

class _SaveditemScreenState extends State<SaveditemScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      context.read<DetailsProvider>().callAllSaveNodeListApi(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);
    return Scaffold(
      appBar: response.isMobile
          ? AppBar(
              title: Text(
                AppStrings.savedItems,
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationView(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(AssetsRes.NOTIFICATION_ICON)),
                const SizedBox(
                  width: 32,
                )
              ],
            )
          : AppBar(
              title: Text(
                AppStrings.savedItems,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
      body: const SavedItemComp(),
    );
  }
}
