import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../data/constants/app_colors.dart';
import '../../res/assets_res.dart';
import 'compontes/custom_textview.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key});

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "All Notes",
          style: TextStyle(
              color: AppColors.background_theme,
              fontSize: 26,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              searchWidget(),
              SizedBox(
                height: 10,
              ),
              nodeListWidget(),
            ],
          ),
        ),
      ),
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
}
