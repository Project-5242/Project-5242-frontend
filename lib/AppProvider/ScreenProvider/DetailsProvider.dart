import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/ResponseModel/ProviderDetailsModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';

import '../../ResponseModel/SavedProvidersModel.dart';

class DetailsProvider extends ChangeNotifier {
  List<ProviderDetailsList> providerList = [];
  Future<void> callDetailsApi({
    required BuildContext context,
    String? categoryId,
  }) async {
    try {
      String apiUrl = qUserProviderDetails;
      if (categoryId != null && categoryId.isNotEmpty) {
        apiUrl = '$apiUrl/category/$categoryId';
      }
      final data = await RemoteService().callGetApi(url: apiUrl);
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
    notifyListeners();
  }

  // Todo Save Node Api

  List<AllSaveNode> saveNodeData = [];

  Future<void> callAllSaveNodeListApi({
    required BuildContext context,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: qSaveNodeList);
      if (data == null) {
        return;
      }
      final saveResponse = SaveNodeListModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (saveResponse.status == 200) {
          saveNodeData = saveResponse.data ?? [];
          notifyListeners();
          showSnackBar(
            context: context,
            message: saveResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: saveResponse.message,
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

  // Todo Add Add Favourite Node

  Future<void> callFavouriteNodeApi({
    required BuildContext context,
    required String providerId,
  }) async {
    try {
      final data = await RemoteService().callPostApi(
          url: qFavouriteNodeApi, jsonData: {"providerId": providerId});
      if (data == null) {
        return;
      }
      final Map<String, dynamic> response = jsonDecode(data.body);
      final dynamic status = response['status'];
      final String message = response['message'];
      if (context.mounted) {
        if (status == 200) {
          notifyListeners();
          callDetailsApi(context: context);
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

  // Todo Remove Provider Api

  Future<void> callRemoveFavouriteNodeApi({
    required BuildContext context,
    required String providerId,
  }) async {
    try {
      final data = await RemoteService()
          .callDeleteApi(url: "$qRemoveProviderId/$providerId");
      if (data == null) {
        return;
      }
      final Map<String, dynamic> response = jsonDecode(data.body);
      final dynamic status = response['status'];
      final String message = response['message'];
      if (context.mounted) {
        if (status == 200) {
          notifyListeners();
          callDetailsApi(context: context);
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
