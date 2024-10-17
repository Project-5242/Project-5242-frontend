import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/NotificationProvider.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/presentation/notifications/components/custom_list_tile.dart';
import 'package:provider/provider.dart';

import '../../base/helpers/textwidget.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context
          .read<NotificationProvider>()
          .callAllNotificationList(context: context);
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

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
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
              ),
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
              child: /* Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: AppColors.dividerColor),
                  const SizedBox(height: 20),
                  _custtomListTile(
                      title: AppStrings.today, listItem: todayLists),
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
              ),*/
                  provider.notificationList.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.notificationList.length,
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Divider(color: AppColors.dividerColor),
                          ),
                          itemBuilder: (context, index) {
                            var notificationData =
                                provider.notificationList[index];
                            return CustomListTile(
                              title: notificationData.title ?? '',
                              description: notificationData.message ?? "",
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: AppColors.background_theme
                                        .withOpacity(0.3),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.grey)),
                                child: Center(
                                  child: TextWidget(
                                    text:
                                        '${notificationData.title?.isNotEmpty == true ? notificationData.title?.substring(0, 1).toUpperCase() : ''}',
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _fadeAnimation.value,
                                child: Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: const TextWidget(
                                    text: "No Saved Provider Yet!",
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }

  Widget _custtomListTile({String? title, required List<dynamic> listItem}) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
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
              itemCount: provider.notificationList.length,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Divider(color: AppColors.dividerColor),
              ),
              itemBuilder: (context, index) {
                var notificationData = provider.notificationList[index];
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
      },
    );
  }
}
