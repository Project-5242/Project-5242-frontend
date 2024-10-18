import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile4.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:image_picker/image_picker.dart';

import '../../ResponseModel/CreateNodeModel.dart';

class CreateNodeProvider extends ChangeNotifier {
  String? selectedValue;
  List<File> selectedImages = [];
  String hours = "";
  void pickImage(ImageSource source) async {
    final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      setSelectedImages(pickedImages);
      logSelectedImages();
    }
  }

  void setSelectedImages(List<XFile> images) {
    selectedImages.addAll(images.map((image) => File(image.path)).toList());
    notifyListeners();
  }

  void logSelectedImages() {
    List<String> imagePaths =
        selectedImages.map((image) => image.path).toList();
    print("Selected Images: $imagePaths");
  }

  Future<void> pickWorkHours(BuildContext context) async {
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (startTime != null) {
      TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (endTime != null) {
        String formattedStartTime = formatTimeOfDay(startTime);
        String formattedEndTime = formatTimeOfDay(endTime);

        hours = '$formattedStartTime - $formattedEndTime';
        notifyListeners();
      }
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hours = time.hour > 12 ? time.hour - 12 : time.hour;
    final minutes = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hours:$minutes $period';
  }

// Method to call API for creating a node
  Future<void> callCreateNodeApi({
    required BuildContext context,
    required String title,
    required String description,
    required String address,
    required dynamic lat,
    required dynamic long,
  }) async {
    if (selectedImages.isEmpty) {
      print("No images selected.");
      return;
    }

    // Log the images that are about to be sent
    print("Images to be uploaded:");
    for (var image in selectedImages) {
      print(image); // Log the image path
    }

    try {
      final data = await RemoteService().callMultipartApi(
        url: qCreateNode,
        fileParamName: "images",
        selectedFile: selectedImages,
        requestBody: {
          'addWorkHour': hours,
          "title": title,
          "addDescription": description,
          "location": address,
          "latitude": lat.toString(),
          "longitude": long.toString(),
          "categoryId": selectedValue.toString(),
        },
      );

      if (data == null) {
        print("API Response is null.");
        return;
      }

      // Log the status code and response body
      print("API Response Status Code: ${data.statusCode}");
      print("API Response Body: ${data.body}");

      // Parse the response
      final decodedData = jsonDecode(data.body);

      // Check if the response is a list or map
      if (decodedData is List) {
        print("Response is a list: $decodedData");
        // Handle list response if necessary
      } else if (decodedData is Map<String, dynamic>) {
        final response = CreateNodeModel.fromJson(decodedData);
        if (context.mounted) {
          if (response.status == 201) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const CreateProfile4()),
              (route) => false,
            );
            showSnackBar(
                context: Routes.navigatorKey.currentContext,
                isSuccess: true,
                message: response.message);
          } else {
            showSnackBar(
                context: Routes.navigatorKey.currentContext,
                isSuccess: false,
                message: response.message);
          }
        }
      } else {
        print("Unexpected response format");
      }
    } catch (e) {
      // Log the error if any exception occurs
      print("Error occurred: $e");
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: "Error uploading files: $e");
    }
  }
}
