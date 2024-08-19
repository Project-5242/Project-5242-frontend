import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project/base/base.dart';

import 'package:flutter_svg/svg.dart';

import '../../data/constants/responsive_view.dart';
import '../../res/assets_res.dart';
import '../../routes/routes.dart';
import 'compontes/custom_textview.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _desktopView(context),
      tablet: _mobileView(context),
    );
  }

  Widget searchWidget() {
    return TextFormField(
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
            color: AppColors.text_colour,
            fontSize: 18,
            fontWeight: FontWeight.w400),
        fillColor: AppColors.text_field_bg,
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
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.text_field_bg,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.text_field_bg,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.text_field_bg,
          ),
        ),
      ),
    );
  }

  Widget categoryListWidget() {
    return Container(
      height: 50.0, // Set the height of the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 50.0,
            decoration: BoxDecoration(
              color: AppColors.category_bg,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withOpacity(0.2),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Category1 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget nodeListWidget() {
    return Container(
      height:
          MediaQuery.of(context).size.height, // Set the height of the ListView
      child: ListView.builder(
        scrollDirection: Axis.vertical, // Horizontal scrolling
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(top: 0, bottom: 10),
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                color: AppColors.node_bg.withOpacity(.4),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.2),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 135,
                    width: 135,
                    decoration: BoxDecoration(
                      color: AppColors.text_colour,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.white.withOpacity(0.2),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextView(
                              "Username",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                            SvgPicture.asset(
                              AssetsRes.ic_heat,
                              height: 25,
                              width: 25,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTextView(
                          "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text_colour),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextView(
                              "Exp 10 yrs",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsRes.ic_heat,
                                  height: 20,
                                  width: 20,
                                  color: AppColors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomTextView(
                                  "Location",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  _mobileView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://www.example.com/profile_picture.jpg', // Replace with your image URL
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        "Hi,Welcome Back,",
                        style: TextStyle(
                            color: AppColors.text_colour,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextView(
                        "John Doe William",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AssetsRes.ic_notification,
                    height: 32,
                    width: 32,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              searchWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTextView(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Spacer(),
                  CustomTextView(
                    "See All",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text_colour),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50.0, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.category_bg,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.2),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Category1 ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomTextView(
                    "All Node",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (context.mounted)
                        context.pushNamedAndRemoveUntil(Routes.allnotes);
                    },
                    child: CustomTextView(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text_colour),
                    ),
                  ),
                ],
              ),
              nodeListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _desktopView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  CustomTextView(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Spacer(),
                  CustomTextView(
                    "See All",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text_colour),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50.0, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.2),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Category1 ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomTextView(
                    "All Node",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (context.mounted)
                        context.pushNamedAndRemoveUntil(Routes.allnotes);
                    },
                    child: CustomTextView(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text_colour),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height *
                    0.4, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                            left: 5, right: 5, bottom: 5, top: 5),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColors.grey,  // Border color

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.2),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 135,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.note_d_bg,
                                    borderRadius: BorderRadius.circular(8.0),

                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.white.withOpacity(0.2),
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      margin: EdgeInsets.all(15),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.white
                                                .withOpacity(0.2),
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                      ),
                                      child: SvgPicture.asset(
                                        AssetsRes.ic_heat,
                                        height: 25,
                                        width: 25,
                                        color: AppColors.black,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomTextView(
                                    "Username",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextView(
                                    "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.text_colour),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextView(
                                        "Exp 10 yrs",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AssetsRes.ic_heat,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.black,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomTextView(
                                            "Location",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
