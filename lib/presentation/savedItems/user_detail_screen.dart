import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:flutter_svg/svg.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 21.0,
                    color: Colors.black,
                  )),
              title: Text(
                AppStrings.details,
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
            )
          : AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  )),
              title: Text(
                AppStrings.details,
                style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
      body: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 301,
                  color: AppColors.grey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                                color: AppColors.black1,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          SvgPicture.asset(AssetsRes.LIKE_ICON)
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SubnodeComp(),
                      const SubnodeComp()
                    ],
                  ),
                )
              ],
            )
          : SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(34, 32, 88, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 48),
                          height: 301,
                          width: 430,
                          decoration: BoxDecoration(
                            color: AppColors.grey1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: TextStyle(
                                  color: AppColors.black1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Exp 10 yrs",
                              style: TextStyle(
                                  color: AppColors.black1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              color: AppColors.grey,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.\n\nJorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                                style: TextStyle(
                                    color: AppColors.black1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsRes.LOCATION_ICON,
                                  color: AppColors.black1,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(
                                      color: AppColors.black1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Expanded(
                    flex: 0,
                    child: Row(
                      children: [
                        SubnodeComp(),
                        SizedBox(
                          width: 122,
                        ),
                        SubnodeComp(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class SubnodeComp extends StatefulWidget {
  const SubnodeComp({super.key});

  @override
  State<SubnodeComp> createState() => _SubnodeCompState();
}

class _SubnodeCompState extends State<SubnodeComp> {
  List<String> dataList = ["27", "26", "25", "24", "23", "22", "21"];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Subnode1",
            style: TextStyle(
                color: AppColors.black1,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 320,
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 0),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index; // Update selected index
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          constraints:
                              const BoxConstraints(maxHeight: 65, maxWidth: 18),
                          margin: const EdgeInsets.only(bottom: 14, right: 20),
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? AppColors.green
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            dataList[index],
                            style: TextStyle(
                                color: AppColors.black1,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit",
                            style: TextStyle(
                                color: AppColors.black1,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Aug 17 to Present",
                            style: TextStyle(
                                color: AppColors.grey1,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                        style: TextStyle(
                          color: AppColors.black1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 109,
                                width: 80,
                                color: AppColors.grey,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
