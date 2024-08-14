import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/constants/app_string.dart';

class StaticProfileLayout extends StatefulWidget {
  final Widget Function() middleContentBuilder;

  const StaticProfileLayout({Key? key, required this.middleContentBuilder})
      : super(key: key);

  @override
  _StaticProfileLayoutState createState() => _StaticProfileLayoutState();
}

class _StaticProfileLayoutState extends State<StaticProfileLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            AppStrings.createProfile,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: IconButton(
                              color: AppColors.themeColor,
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {},
                            )),
                        Text(
                          '${currentIndex + 1}/3',
                          style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    LinearProgressIndicator(
                      value: (currentIndex + 1) / 3,
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(4),
                      minHeight: 5,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    widget.middleContentBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
