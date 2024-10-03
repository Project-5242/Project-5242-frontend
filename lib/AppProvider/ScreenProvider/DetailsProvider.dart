import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/ResponseModel/ProviderDetailsModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';

class DetailsProvider extends ChangeNotifier {
  List<ProviderDetailsList> providerList = [];
  Future<void> callDetailsApi({required BuildContext context}) async {
    try {
      final data = await RemoteService().callGetApi(url: qProviderDetails);
      if (data == null) {
        return;
      }
      final providerDetailsResponse =
          ProviderDetailsModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (providerDetailsResponse.status == 200) {
          providerList = providerDetailsResponse.data ?? [];
          notifyListeners();

          showSnackBar(
            context: context,
            message: providerDetailsResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: providerDetailsResponse.message,
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
  }
}
