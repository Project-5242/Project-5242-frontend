import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../base/Remote/api_config.dart';
import '../../base/Remote/remote_service.dart';
import '../../base/helpers/helper.dart';

class ContentProvider with ChangeNotifier {
  var respone;
  Future<void> callContentApi({
    required BuildContext context,
    required String type,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: "$qInfoApi/$type");
      if (data == null) {
        return;
      }
      final Map<String, dynamic> response = jsonDecode(data.body);
      final dynamic status = response['status'];
      final dynamic data1 = response['data'];
      final String message = response['message'];
      if (context.mounted) {
        if (status == 200) {
          respone = response;
          notifyListeners();
          showSnackBar(
            context: context,
            message: message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: message,
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
