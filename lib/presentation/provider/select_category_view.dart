import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:provider/provider.dart';
import '../../ResponseModel/CategoriesResponseModel.dart';

import '../../base/helpers/helper.dart';

class SelectCategoryView extends StatefulWidget {
  final String? emailController;
  final String? roleType;
  final String? passwordController;
  final String? fullnameController;
  final String? mobileController;
  final String? bio;
  final File? profilePhoto;

  const SelectCategoryView({
    super.key,
    this.emailController,
    this.roleType,
    this.passwordController,
    this.fullnameController,
    this.mobileController,
    this.bio,
    this.profilePhoto,
  });

  @override
  State<SelectCategoryView> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends State<SelectCategoryView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  List<CategoriesList> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    
    if (widget.bio != null && widget.bio!.isNotEmpty) {
      bioController.text = widget.bio!;
    }
    
    Future.delayed(Duration.zero, () {
      context.read<SignUpProvider>().allCategoryApi(context: context);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          context.read<SignUpProvider>().currentPage < context.read<SignUpProvider>().totalPages) {
        context.read<SignUpProvider>().currentPage++;
        context.read<SignUpProvider>().allCategoryApi(context: context);
      }
    });
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
        filteredCategories = categoryProvider.categoriesList.where((category) {
          final query = searchController.text.toLowerCase();
          return category.categoryName?.toLowerCase().contains(query) ?? false;
        }).toList();

        return Scaffold(
          extendBodyBehindAppBar: true,
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
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white.withOpacity(0.9),
                    AppColors.white.withOpacity(0.95),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Select at least one category that matches your services',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkBlue.withOpacity(0.7),
                          fontFamily: Fonts.fontsOpenSans,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      
                      child: TextField(
                        controller: searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Search categories...',
                          prefixIcon: Icon(Icons.search, color: AppColors.darkBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      // child: TextField(
                      //   controller: bioController,
                      //   maxLines: 3,
                      //   decoration: InputDecoration(
                      //     hintText: 'Tell us about yourself (Bio)',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     filled: true,
                      //     fillColor: AppColors.white,
                      //     contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      //   ),
                      // ),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: filteredCategories.isNotEmpty
                            ? NotificationListener<ScrollNotification>(
                                onNotification: (notification) {
                                  if (notification is ScrollEndNotification &&
                                      _scrollController.position.extentAfter == 0 &&
                                      context.read<SignUpProvider>().currentPage < context.read<SignUpProvider>().totalPages) {
                                    context.read<SignUpProvider>().currentPage++;
                                    context.read<SignUpProvider>().allCategoryApi(context: context);
                                  }
                                  return false;
                                },
                                child: Container(
                                  key: ValueKey('categories'),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: filteredCategories.length,
                                      itemBuilder: (context, index) {
                                        var catData = filteredCategories[index];
                                        catData.isSelected ??= false;
                                        return AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: index < filteredCategories.length - 1
                                                  ? BorderSide(
                                                      color: AppColors.borderColor.withOpacity(0.1),
                                                      width: 1,
                                                    )
                                                  : BorderSide.none,
                                            ),
                                          ),
                                          child: ListTile(
                                            minTileHeight: 56,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                            leading: Transform.scale(
                                              scale: 1.3,
                                              child: Checkbox(
                                                value: catData.isSelected,
                                                checkColor: AppColors.white,
                                                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                                  if (states.contains(MaterialState.selected)) {
                                                    return AppColors.darkBlue;
                                                  }
                                                  return AppColors.white;
                                                }),
                                                side: BorderSide(
                                                  color: AppColors.borderColor.withOpacity(0.3),
                                                  width: 1,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    catData.isSelected = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            title: Text(
                                              '${catData.categoryName}',
                                              style: TextStyle(
                                                fontFamily: Fonts.fontsOpenSans,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                key: ValueKey('no-results'),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: 48,
                                      color: AppColors.darkBlue.withOpacity(0.3),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      searchController.text.isEmpty
                                          ? "No Categories Available"
                                          : "No results for '${searchController.text}'",
                                      style: TextStyle(
                                        color: AppColors.darkBlue.withOpacity(0.6),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.darkBlue,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final selectedCategories = filteredCategories
                                .where((category) => category.isSelected == true)
                                .toList();
                            if (selectedCategories.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please select at least one category'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            
                            final String enteredBio = bioController.text.trim();
                            if (enteredBio.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please enter a bio about yourself'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            
                            context.read<SignUpProvider>().signUpApi(
                              context: context,
                              fullName: widget.fullnameController ?? "",
                              password: widget.passwordController ?? "",
                              email: widget.emailController ?? "",
                              mobileNumber: widget.mobileController ?? "",
                              bio: enteredBio,
                              categoryIds: selectedCategories.map((category) => category.id ?? '').where((id) => id.isNotEmpty).toList(),
                              type: true,
                              profilePhoto: widget.profilePhoto
                            );
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                              fontFamily: Fonts.fontsOpenSans,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_project/base/base.dart';
// import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
// import 'package:provider/provider.dart';

// import '../../base/helpers/helper.dart';

// class SelectCategoryView extends StatefulWidget {
//   final String? emailController;
//   final String? roleType;
//   final String? passwordController;
//   final String? fullnameController;
//   final String? mobileController;

//   const SelectCategoryView({
//     super.key,
//     this.emailController,
//     this.roleType,
//     this.passwordController,
//     this.fullnameController,
//     this.mobileController,
//   });

//   @override
//   State<SelectCategoryView> createState() => _SelectCategoryViewState();
// }

// class _SelectCategoryViewState extends State<SelectCategoryView> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       context.read<SignUpProvider>().allCategoryApi(context: context);
//     });

//     setupScrollListener(
//       scrollController: _scrollController,
//       currentPage: context.read<SignUpProvider>().currentPage,
//       totalPages: context.read<SignUpProvider>().totalPages,
//       onPageEndReached: () {
//         context.read<SignUpProvider>().currentPage++;
//         context.read<SignUpProvider>().allCategoryApi(context: context);
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sized = MediaQuery.of(context).size;

//     return Consumer<SignUpProvider>(
//       builder: (context, categoryProvider, child) {
//         return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: Text(
//                 'Choose Your Category',
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.darkBlue,
//                   fontFamily: Fonts.fontsOpenSans,
//                 ),
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Center(
//                 child: categoryProvider.categoriesList.isNotEmpty
//                     ? Container(
//                         margin: const EdgeInsets.symmetric(vertical: 20.0),
//                         padding: EdgeInsets.only(
//                           bottom: MediaQuery.sizeOf(context).height * 0.05,
//                           top: MediaQuery.sizeOf(context).height * 0.02,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: AppColors.borderColor.withOpacity(0.3),
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: ListView.builder(
//                           controller:
//                               _scrollController, // Attach custom scroll controller
//                           shrinkWrap: true,
//                           itemCount: categoryProvider.categoriesList.length,
//                           itemBuilder: (context, index) {
//                             var catData =
//                                 categoryProvider.categoriesList[index];
//                             catData.isSelected ??= false;
//                             return ListTile(
//                               minTileHeight: 45,
//                               minVerticalPadding: 0,
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                                 vertical: 0,
//                               ),
//                               horizontalTitleGap: 0,
//                               leading: Transform.scale(
//                                 scale: 1.3,
//                                 child: Checkbox(
//                                   value: catData.isSelected,
//                                   checkColor: AppColors.black,
//                                   fillColor: MaterialStateProperty.all(
//                                       AppColors.white),
//                                   side: BorderSide(
//                                     color: AppColors.black.withOpacity(0.2),
//                                     width: 1,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(1),
//                                   ),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       catData.isSelected = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               title: Text(
//                                 '${catData.categoryName}',
//                                 style: TextStyle(
//                                   fontFamily: Fonts.fontsOpenSans,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.black,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : Text(
//                         "No Category Found!",
//                         style: TextStyle(
//                           color: AppColors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//               ),
//             ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   AppButton(
//                     width: sized.width * 0.85,
//                     height: 50,
//                     radius: 10,
//                     backgroundColor: AppColors.darkBlue,
//                     title: "Sign Up",
//                     style: TextStyle(
//                       fontFamily: Fonts.fontsOpenSans,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.white,
//                     ),
//                     onPressed: () {
//                       categoryProvider.signUpApi(
//                         context: context,
//                         fullName: widget.fullnameController.toString(),
//                         password: widget.passwordController.toString(),
//                         email: widget.emailController.toString(),
//                         mobileNumber: widget.mobileController.toString(),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }