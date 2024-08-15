import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/notifications/components/custom_list_tile.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List todayLists = [
    {
      "icon": "assets/icon/Discount-duotone.png",
      "title": "30% Special Discount!",
      "description": "Special promotion only valid today.",
    },
  ];
  List yesterdayLists = [
    {
      "icon": "assets/icon/Wallet-duotone.png",
      "title": "Top Up E-wallet Successfully!",
      "description": "You have top up your e-wallet.",
    },
    {
      "icon": "assets/icon/Location-duotone.png",
      "title": "New Service Available!",
      "description": "Now you can track order in real-time.",
    }
  ];
  List monthLists = [
    {
      "icon": "assets/icon/Card-duotone.png",
      "title": "Credit Card Connected!",
      "description": "Credit card has been linked.",
    },
    {
      "icon": "assets/icon/User-duotone.png",
      "title": "Account Setup Successfully!",
      "description": "Your account has been created.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.notification,
          style: TextStyle(
            fontFamily: Fonts.fontsOpenSans,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.darkBlue,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetsRes.EMPTYNOTIFICATION_SVG),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.dividerColor),
              const SizedBox(height: 20),
              _custtomListTile(title: AppStrings.today, listItem: todayLists),
              const SizedBox(height: 10),
              Divider(color: AppColors.dividerColor),
              const SizedBox(height: 10),
              _custtomListTile(
                  title: AppStrings.yesterday, listItem: yesterdayLists),
              const SizedBox(height: 10),
              Divider(color: AppColors.dividerColor),
              const SizedBox(height: 10),
              _custtomListTile(title: "June 7, 2023", listItem: monthLists),
            ],
          ),
        ),
      ),
    );
  }

  Widget _custtomListTile({String? title, required List<dynamic> listItem}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontFamily: Fonts.fontsOpenSans,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listItem.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Divider(color: AppColors.dividerColor),
          ),
          itemBuilder: (context, index) {
            return CustomListTile(
              title: listItem[index]["title"],
              description: listItem[index]["description"],
              leading: Image.asset(
                listItem[index]["icon"],
                height: 24,
              ),
            );
          },
        )
      ],
    );
  }
}
