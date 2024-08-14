

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/themes/colors.dart';
import 'package:flutter_svg/svg.dart';

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
              color: Mycolors.background_theme, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      backgroundColor: Mycolors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(children: [
SizedBox(height: 20,),
            searchWidget(),
            nodeListWidget(),
          ],),
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
            color: Mycolors.text_colour,
            fontSize: 18,
            fontWeight: FontWeight.w400),
        fillColor: Mycolors.text_field_bg,
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
            color: Mycolors.text_field_bg,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: Mycolors.text_field_bg,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1,
            color: Mycolors.text_field_bg,
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
                color: Mycolors.node_bg.withOpacity(.4),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Mycolors.white.withOpacity(0.2),
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
                      color: Mycolors.text_colour,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Mycolors.white.withOpacity(0.2),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextView(
                              "Username",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Mycolors.black),
                            ),
                            SvgPicture.asset(
                              AssetsRes.ic_heat,
                              height: 25,
                              width: 25,
                              color: Mycolors.black,
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        CustomTextView(
                          "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Mycolors.text_colour),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextView(
                              "Exp 10 yrs",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Mycolors.black),
                            ),

                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsRes.ic_heat,
                                  height: 20,
                                  width: 20,
                                  color: Mycolors.black,
                                ),
                                SizedBox(width: 5,),
                                CustomTextView(
                                  "Location",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Mycolors.black),
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
