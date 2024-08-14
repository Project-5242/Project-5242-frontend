import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/assets_res.dart';
import '../../themes/colors.dart';
import 'home_widget.dart';

class DashbaordWidget extends StatefulWidget {
  final int currentIndex;
  DashbaordWidget({super.key, required this.currentIndex});

  @override
  _DashbaordWidgetState createState() => _DashbaordWidgetState();
}

class _DashbaordWidgetState extends State<DashbaordWidget> {
  int _currentIndex = 0;
  final bottomNavKey = GlobalKey();
  final List<Widget> _pages = const [
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _currentIndex = widget.currentIndex;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 65,
        key: bottomNavKey,
        color: Mycolors.white,
        child: Column(
          children: [
            Container(
              height: 1,
              color: Mycolors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavItem(
                  title: "",
                  icon: AssetsRes.ic_home,
                  isSelected: _currentIndex == 0,
                  onTap: () {
                    if (_currentIndex != 0) {
                      setState(() {
                        _currentIndex = 0;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon:  AssetsRes.ic_heat,
                  isSelected: _currentIndex == 1,
                  onTap: () {
                    if (_currentIndex != 1) {
                      setState(() {
                        _currentIndex = 1;
                      });
                    }
                  },
                ),
                bottomNavItem(
                    title: "",
                    icon: AssetsRes.ic_chat,
                    isSelected: _currentIndex == 2,
                    onTap: () {
                      setState(
                        () {
                          if (_currentIndex != 2) {
                            setState(() {
                              _currentIndex = 2;
                            });
                          }
                        },
                      );
                    }),
                bottomNavItem(
                    title: "",
                    icon: AssetsRes.ic_user,
                    isSelected: _currentIndex == 3,
                    onTap: () {
                      setState(
                            () {
                          if (_currentIndex != 3) {
                            setState(() {
                              _currentIndex = 3;
                            });
                          }
                        },
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem({
    required String title,
    required String icon,
    required bool isSelected,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? Container(
                  height: 45,
                  width: 45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Mycolors.background_theme,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Mycolors.white.withOpacity(0.2),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color: Mycolors.white,
                  ),
                )
              : Container(
                  height: 45,
                  width: 45,
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color: Mycolors.black,
                  ),
                ),
        ],
      ),
    );
  }
}
