import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/ResponseModel/NotificationListModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';

import '../../base/helpers/helper.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationList> notificationList = [];
  Future<void> callAllNotificationList({
    required BuildContext context,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: qNotificationList);
      if (data == null) {
        return;
      }
      final notificationResponse =
          NotificationListModel.fromJson(jsonDecode(data.body));
      if (!context.mounted) return;
      if (notificationResponse.status == 200) {
        notificationList = notificationResponse.data ?? [];
        notifyListeners();
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: notificationResponse.message,
            isSuccess: true,
          );
        }
      } else {
        // Show error SnackBar only if the context is still valid
        if (context.mounted) {
          showSnackBar(
            context: context,
            message: notificationResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }

    notifyListeners();
  }
}
