import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: AppColors.primary,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}

void showSnackBar({
  BuildContext? context,
  String? message,
  bool isSuccess = true,
}) {
  final snackBar = SnackBar(
    elevation: 6,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        isSuccess
            ? Icon(Icons.check, color: AppColors.white)
            : Icon(Icons.error_outline_rounded, color: AppColors.white),
        widthGap(10),
        Flexible(
            child: Text(
          message ?? "",
          style: TextStyle(color: AppColors.white),
          overflow: TextOverflow.fade,
        )),
      ],
    ),
    backgroundColor: isSuccess ? AppColors.textGrey : AppColors.red,
  );
  ScaffoldMessenger.of(context!).showSnackBar(snackBar);
}

SizedBox widthGap(double width) {
  return SizedBox(
    width: width,
  );
}

void setupScrollListener({
  required ScrollController scrollController,
  required int currentPage,
  required int totalPages,
  required VoidCallback onPageEndReached,
}) {
  scrollController.addListener(() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Log a message when the user reaches the end
      debugPrint("Reached end of the scroll");

      // Trigger the callback if there are more pages
      if (currentPage < totalPages) {
        onPageEndReached();
      }
    }
  });
}

void openImagePickerBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                text: "Choose File For Upload"),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from Gallery'),
                    onTap: () {
                      context
                          .read<SignUpProvider>()
                          .pickImage(ImageSource.gallery);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.grey,
                    ),
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a Photo'),
                    onTap: () {
                      context
                          .read<SignUpProvider>()
                          .pickImage(ImageSource.camera);
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

File? image;

DateTime? currentBackPressTime;

Future<bool> onWillPop() async {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    ScaffoldMessenger.of(Routes.navigatorKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text(
          'Please click back again to exit',
        ),
      ),
    );
    return false;
  }
  return true;
}

class CommonDialog extends StatelessWidget {
  final Widget titleWidget;
  final Color backgroundColor;
  final double? height;
  final double? width;

  const CommonDialog({
    super.key,
    required this.titleWidget,
    required this.backgroundColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            height: height,
            width: width,
            child: titleWidget,
          ),
        ],
      ),
    );
  }
}

void showLogoutDialog({
  required BuildContext context,
  required void Function() onPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CommonDialog(
        backgroundColor: Colors.white,
        titleWidget: Column(
          children: [
            Lottie.asset('assets/lottie/Logout.json', height: 150),
            const TextWidget(
              textAlign: TextAlign.center,
              text: 'Do you want to Logout your account?',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10.0),
            const TextWidget(
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 12,
              text:
                  'Don’t worry, you can again login your account with your mail. and password',
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: AppButton(
                    title: 'Yes',
                    backgroundColor: AppColors.themeColor,
                    onPressed: onPressed,
                    height: 50,
                    width: 0.0,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: AppButton(
                    textColor: AppColors.black,
                    title: 'No',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    height: 30,
                    width: 0.0,
                  ),
                )),
              ],
            ),
          ],
        ),
      );
    },
  );
}
