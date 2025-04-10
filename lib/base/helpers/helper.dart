import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

showLoaderDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/lottie/loading.json',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      );
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
    backgroundColor: isSuccess ? AppColors.green : AppColors.red,
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

void openImagePickerBottomSheet(
    {required BuildContext context,
    required void Function() onTapCamera,
    required void Function() onTapGallery}) {
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
                    onTap: onTapGallery,
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
                      onTap: onTapCamera),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

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

String formatTimeOfDay(TimeOfDay time) {
  final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final period = time.period == DayPeriod.am ? "AM" : "PM";
  return "$hours:00$period"; // Assuming you don't need to handle minutes
}

Future<void> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  if (pickedFile != null) {}
}

String formatDateTimeToIST(String utcDateTime) {
  DateTime parsedDateTime = DateTime.parse(utcDateTime);

  DateTime istDateTime =
      parsedDateTime.toUtc().add(Duration(hours: 5, minutes: 30));

  String formattedDateTime =
      DateFormat('dd MMM yyyy, hh:mm a').format(istDateTime);

  return formattedDateTime;
}
