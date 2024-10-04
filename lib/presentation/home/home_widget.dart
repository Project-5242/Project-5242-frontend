import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/DetailsProvider.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/home/notes_widget.dart';
import 'package:provider/provider.dart';

import '../../base/helpers/helper.dart';
import '../../data/constants/responsive_view.dart';
import 'compontes/custom_textview.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<SignUpProvider>().init();
      context.read<DetailsProvider>().callDetailsApi(context: context);
      setupScrollListener(
        scrollController: context.read<SignUpProvider>().scrollController,
        currentPage: context.read<SignUpProvider>().currentPage,
        totalPages: context.read<SignUpProvider>().totalPages,
        onPageEndReached: () {
          context.read<SignUpProvider>().currentPage++;
          context
              .read<SignUpProvider>()
              .allCategoryApi(context: Routes.navigatorKey.currentContext!);
        },
      );
    });
    super.initState();
  }

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
    return Consumer<SignUpProvider>(builder: (context, categoryValue, child) {
      return SizedBox(
        height: 50.0,
        child: ListView.builder(
          controller: categoryValue.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: categoryValue.categoriesList.length,
          itemBuilder: (context, index) {
            var data = categoryValue.categoriesList[index];
            return Container(
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                  "${data.categoryName}",
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
    });
  }

  Widget nodeListWidget() {
    return Consumer<DetailsProvider>(builder: (context, detailProvider, child) {
      return Column(
        children: [
          Row(
            children: [
              CustomTextView(
                "All Node",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotesWidget(
                        providerList: detailProvider.providerList,
                      ),
                    ),
                  );
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: detailProvider.providerList.length,
              itemBuilder: (context, index) {
                var detailData = detailProvider.providerList[index];
                return Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                              (detailData.nodes != null &&
                                      detailData.nodes!.isNotEmpty &&
                                      detailData.nodes!.first.images != null &&
                                      detailData
                                          .nodes!.first.images!.isNotEmpty)
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomTextView(
                                      detailData.providerId?.fullName
                                              ?.capitalized ??
                                          "Unknown",
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
                                "${(detailData.nodes != null && detailData.nodes!.isNotEmpty) ? detailData.nodes!.first.title?.capitalized : "No title available"}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                              const SizedBox(height: 2),
                              CustomTextView(
                                "${(detailData.nodes != null && detailData.nodes!.isNotEmpty) ? detailData.nodes!.first.addDescription?.capitalized : "No description available"}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.text_colour),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            "${(detailData.nodes != null && detailData.nodes!.isNotEmpty) ? detailData.nodes!.first.location?.capitalized : "No Location available"}",
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
          ),
        ],
      );
    });
  }

  _mobileView(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      backgroundImage: NetworkImage(
                        '${sharedPrefs?.getString(AppStrings.userImage)}', // Replace with your image URL
                      ),
                    ),
                    const SizedBox(
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
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextView(
                          "${sharedPrefs?.getString(AppStrings.userName)}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AssetsRes.ic_notification,
                      height: 32,
                      width: 32,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                searchWidget(),
                const SizedBox(
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
                    const Spacer(),
                    CustomTextView(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text_colour),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    controller: value.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.categoriesList.length,
                    itemBuilder: (context, index) {
                      var catData = value.categoriesList[index];
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        padding: const EdgeInsets.only(left: 15, right: 15),
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
                            "${catData.categoryName?.capitalized}",
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
                const SizedBox(
                  height: 10,
                ),
                nodeListWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }

  _desktopView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              const SizedBox(
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
                  const Spacer(),
                  CustomTextView(
                    "See All",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text_colour),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.0, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      padding: const EdgeInsets.only(left: 15, right: 15),
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
              const SizedBox(
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
                  const Spacer(),
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
