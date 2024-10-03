import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:provider/provider.dart';

import '../../base/helpers/helper.dart';

class SelectCategoryView extends StatefulWidget {
  final String? emailController;
  final String? roleType;
  final String? passwordController;
  final String? fullnameController;
  final String? mobileController;

  const SelectCategoryView({
    super.key,
    this.emailController,
    this.roleType,
    this.passwordController,
    this.fullnameController,
    this.mobileController,
  });

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<SignUpProvider>().allCategoryApi(context: context);
    });

    setupScrollListener(
      scrollController: _scrollController,
      currentPage: context.read<SignUpProvider>().currentPage,
      totalPages: context.read<SignUpProvider>().totalPages,
      onPageEndReached: () {
        context.read<SignUpProvider>().currentPage++;
        context.read<SignUpProvider>().allCategoryApi(context: context);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    return Consumer<SignUpProvider>(
      builder: (context, categoryProvider, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Choose Your Category',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue,
                  fontFamily: Fonts.fontsOpenSans,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: categoryProvider.categoriesList.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height * 0.05,
                          top: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                          controller:
                              _scrollController, // Attach custom scroll controller
                          shrinkWrap: true,
                          itemCount: categoryProvider.categoriesList.length,
                          itemBuilder: (context, index) {
                            var catData =
                                categoryProvider.categoriesList[index];
                            catData.isSelected ??= false;
                            return ListTile(
                              minTileHeight: 45,
                              minVerticalPadding: 0,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              horizontalTitleGap: 0,
                              leading: Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: catData.isSelected,
                                  checkColor: AppColors.black,
                                  fillColor: MaterialStateProperty.all(
                                      AppColors.white),
                                  side: BorderSide(
                                    color: AppColors.black.withOpacity(0.2),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      catData.isSelected = value!;
                                    });
                                  },
                                ),
                              ),
                              title: Text(
                                '${catData.categoryName}',
                                style: TextStyle(
                                  fontFamily: Fonts.fontsOpenSans,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Text(
                        "No Category Found!",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    width: sized.width * 0.85,
                    height: 50,
                    radius: 10,
                    backgroundColor: AppColors.darkBlue,
                    title: "Sign Up",
                    style: TextStyle(
                      fontFamily: Fonts.fontsOpenSans,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      categoryProvider.signUpApi(
                        context: context,
                        fullName: widget.fullnameController.toString(),
                        password: widget.passwordController.toString(),
                        email: widget.emailController.toString(),
                        mobileNumber: widget.mobileController.toString(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
