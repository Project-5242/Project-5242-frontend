import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:flutter_project/presentation/widgets/custom_text_from_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await context
          .read<SignUpProvider>()
          .callGetUserDetailsApi(context: context);

      final userDetails =
          context.read<SignUpProvider>().getUserDetailModel.data?.user;

      setState(() {
        nameController.text = userDetails?.fullName ?? '';
        emailController.text = userDetails?.email ?? '';
        phoneController.text = userDetails?.mobileNumber ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<SignUpProvider>(builder: (context, profileValue, child) {
      return ResponsiveView(
        mobile: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: height * 0.23,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        height: height * 0.18,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      Positioned(
                        top: height * 0.12,
                        right: 0,
                        left: 0,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.white,
                          child: (profileValue.selectedImage != null)
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.file(
                                      profileValue.selectedImage!,
                                      height: 110,
                                      width: 110,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : (profileValue.getUserDetailModel.data?.user
                                              ?.profilePhoto !=
                                          null &&
                                      profileValue.getUserDetailModel.data!
                                          .user!.profilePhoto!.isNotEmpty)
                                  ? CircleAvatar(
                                      radius: 50,
                                      child: ClipOval(
                                        child: Image.network(
                                          profileValue.getUserDetailModel.data!
                                              .user!.profilePhoto!,
                                          height: 110,
                                          width: 110,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            // Fallback to default image in case of network error
                                            return Image.asset(
                                              AssetsRes.noProfile,
                                              height: 110,
                                              width: 110,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.asset(
                                        AssetsRes.noProfile,
                                        height: 110,
                                        width: 110,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SvgPicture.asset(AssetsRes.ARROWBACK_SVG),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: AppColors.black,
                    ),
                    onPressed: () {
                      Share.share("App is under development");
                    },
                  ),
                ],
                centerTitle: true,
                title: Text(
                  AppStrings.editProfile,
                  style: TextStyle(
                    fontFamily: Fonts.fontsOpenSans,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Form(
                    child: Column(
                      children: [
                        // Adjust spacing
                        AppButton(
                          height: 37,
                          width: 100,
                          backgroundColor: AppColors.darkBlue,
                          title: "Change Picture",
                          onPressed: () {
                            openImagePickerBottomSheet(
                              context: context,
                              onTapCamera: () {
                                profileValue.pickImage(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              onTapGallery: () {
                                profileValue.pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                        SizedBox(height: height * 0.04),
                        CustomTextFormField(
                          controller: nameController,
                          title: "Full Name",
                          hintText: "Enter Your Full Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        CustomTextFormField(
                          readOnly: true,
                          controller: emailController,
                          title: "Email",
                          hintText: "Enter Your Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        CustomTextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true, signed: true),
                          title: "Phone Number",
                          hintText: "Enter Your Phone Number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phone Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppButton(
              height: 50,
              width: 100,
              backgroundColor: AppColors.darkBlue,
              title: "Update",
              onPressed: () {
                profileValue.callUpdateProfileDetailApi(
                    context: context,
                    phone: phoneController.text.trim(),
                    fullName: nameController.text.trim());
              },
            ),
          ),
        ),
      );
    });
  }
}
