import 'package:flutter/material.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/savedItems/user_detail_screen.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../AppProvider/ScreenProvider/DetailsProvider.dart';

class SavedItemComp extends StatefulWidget {
  const SavedItemComp({super.key});

  @override
  State<SavedItemComp> createState() => _SavedItemCompState();
}

class _SavedItemCompState extends State<SavedItemComp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

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
    Future.delayed(Duration.zero, () {
      context.read<DetailsProvider>().callAllSaveNodeListApi(context: context);
    });
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final response = ResponsiveCheck(context);
    return Consumer<DetailsProvider>(builder: (context, value, child) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return value.saveNodeData.isNotEmpty
              ? GridView.builder(
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
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.fromLTRB(7, 10, 0, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: (data.nodes != null &&
                                data.nodes!.isNotEmpty &&
                                data.nodes!.first.images != null &&
                                data.nodes!.first.images!.isNotEmpty)
                            ? DecorationImage(
                                scale: 2,
                                image: NetworkImage(
                                    data.nodes!.first.images!.first),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {},
                              )
                            : const DecorationImage(
                                scale: 2,
                                image: AssetImage('assets/images/img.png'),
                                fit: BoxFit.cover,
                              ),
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
                                  } else if (value == 2) {}
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    padding: const EdgeInsets.all(8),
                                    value: 1,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserDetailScreen(
                                              providerId: data.providerId,
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 20),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1, color: AppColors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        value
                                            .callRemoveFavouriteNodeApi(
                                                context: context,
                                                providerId:
                                                    data.providerId ?? "")
                                            .then((v) {
                                          value.callAllSaveNodeListApi(
                                              context: context);
                                        });
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 20),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1, color: AppColors.blue),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      ? AppColors.black
                                      : AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Work 10 hrs",
                                style: TextStyle(
                                  color: response.isMobile || response.isTablet
                                      ? AppColors.black
                                      : AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsRes.LOCATION_ICON,
                                    color:
                                        response.isMobile || response.isTablet
                                            ? AppColors.white
                                            : AppColors.black,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        color: response.isMobile ||
                                                response.isTablet
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
                );
        },
      );
    });
  }
}
