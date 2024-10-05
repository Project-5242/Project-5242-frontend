import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/chatWithHelpScreen.dart';
import 'package:flutter_project/presentation/savedItems/savedItem_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/responsive_view.dart';
import '../../res/assets_res.dart';
import '../profile/profile_view.dart';
import 'home_widget.dart';

class DashbaordWidget extends StatefulWidget {
  final int? currentIndex;
  DashbaordWidget({super.key, this.currentIndex});

  @override
  _DashbaordWidgetState createState() => _DashbaordWidgetState();
}

class _DashbaordWidgetState extends State<DashbaordWidget> {
  int _currentIndex = 0;
  final bottomNavKey = GlobalKey();
  final List<Widget> _pages = const [
    HomeWidget(),
    SaveditemScreen(),
    ChatWithHelpScreen(),
    ProfileView(),
  ];

  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    setState(() {
      _currentIndex = widget.currentIndex ?? 0;
    });

    super.initState();
  }

  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _desktopView(
        context,
      ),
      tablet: _mobileView(context),
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
                    color: AppColors.background_theme,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.2),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color: AppColors.white,
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
                    color: AppColors.black,
                  ),
                ),
        ],
      ),
    );
  }

  _mobileView(BuildContext context) {
    return Scaffold(
      body: /*Platform.isAndroid||Platform.isAndroid ?*/ _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 65,
        key: bottomNavKey,
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              height: 1,
              color: AppColors.white,
            ),
            const SizedBox(height: 10),
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
                  icon: AssetsRes.ic_heat,
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

  _desktopView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: AppColors.white,
        leading: Container(
          height: 20,
          width: 20,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: AppColors.darkBlue,
        ),
        title: Text(
          "App Name",
          style: TextStyle(
              color: AppColors.text_colour,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.3,
                  child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: AppColors.text_colour,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: AppColors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: SvgPicture.asset(
                          AssetsRes.ic_search,
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                      // contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.text_field_bg,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.text_field_bg,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.text_field_bg,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                SvgPicture.asset(
                  AssetsRes.ic_notification,
                  height: 32,
                  width: 32,
                ),
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: CachedNetworkImageProvider(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Googleplex_HQ_%28cropped%29.jpg/1200px-Googleplex_HQ_%28cropped%29.jpg', // Replace with your image URL
                  ),
                ),
              ],
            ),
          )
        ],
        // Change the background color of the AppBar
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.compact,
              backgroundColor: AppColors.darkBlue,
              showHamburger: false,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.white,
              unselectedIconColor: Colors.white,
              itemOuterPadding: const EdgeInsets.symmetric(vertical: 10),
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.black,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.grey[200]
            ),
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Users',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.heart_broken),
              ),
              SideMenuItem(
                title: 'Users',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.chat),
              ),
              SideMenuItem(
                title: 'Users',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
            ],
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  void _toggleDrawer() {
    setState(() {
      isExpanded = !isExpanded; // Toggle the drawer's expanded state
    });
  }

  void _onMenuItemClicked() {
    // Collapse the drawer when a menu item is clicked
    if (isExpanded) {
      _toggleDrawer();
    }
  }
}
