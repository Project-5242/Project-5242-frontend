import 'package:flutter/material.dart';
import 'package:flutter_project/ResponseModel/ProviderDetailsModel.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/responsive_view.dart';
import '../../res/assets_res.dart';
import 'compontes/custom_textview.dart';

class NotesWidget extends StatefulWidget {
  final List<ProviderDetailsList>? providerList;
  const NotesWidget({super.key, this.providerList});

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
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

  Widget nodeListWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.45,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.providerList?.length,
        itemBuilder: (context, index) {
          var detailData = widget.providerList?[index];
          return Container(
              margin: const EdgeInsets.only(top: 0, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.2),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Image.network(
                        fit: BoxFit.fill,
                        (detailData?.nodes != null &&
                                detailData!.nodes!.isNotEmpty &&
                                detailData.nodes!.first.images != null &&
                                detailData.nodes!.first.images!.isNotEmpty)
                            ? detailData.nodes!.first.images!.first
                            : 'https://www.example.com/default_image.jpg',
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/img.png');
                        },
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextView(
                                detailData?.providerId?.fullName ?? "Unknown",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                            ),
                            const Icon(Icons.favorite_border),
                          ],
                        ),
                        const SizedBox(height: 5),
                        CustomTextView(
                          "${(detailData?.nodes != null && detailData!.nodes!.isNotEmpty) ? detailData.nodes!.first.title : "No title available"}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                        const SizedBox(height: 2),
                        CustomTextView(
                          "${(detailData?.nodes != null && detailData!.nodes!.isNotEmpty) ? detailData.nodes!.first.addDescription : "No description available"}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text_colour),
                        ),
                        const SizedBox(height: 8),
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
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomTextView(
                                      "${(detailData?.nodes != null && detailData!.nodes!.isNotEmpty) ? detailData.nodes!.first.location : "No Location available"}",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black),
                                    ),
                                  ),
                                ],
                              ),
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
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              searchWidget(),
              const SizedBox(
                height: 10,
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
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * .5,
                  child: TextFormField(
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
                  ),
                ),
              ],
            ),
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.4, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 5, top: 5),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColors.grey, // Border color
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
                                      margin: const EdgeInsets.all(15),
                                      padding: const EdgeInsets.all(5),
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
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
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
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextView(
                                    "Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac  mattis.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.text_colour),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          const SizedBox(
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
