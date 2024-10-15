import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/ResponseModel/AllChatUserListModel.dart';
import 'package:flutter_project/ResponseModel/AllMessageModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';

class MessageProvider with ChangeNotifier {
  // Todo Api Call

  List<AllChatList> allChatList = [];

  Future<void> callAllChatListApi({
    required BuildContext context,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: qAllChatList);
      if (data == null) {
        return;
      }
      final allChatResponse =
          AllChatUserListModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (allChatResponse.status == "success" ||
            allChatResponse.status == 200) {
          allChatList = allChatResponse.data ?? [];
          notifyListeners();

          showSnackBar(
            context: context,
            message: allChatResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: allChatResponse.message,
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

  // Todo All Message Api

  List<Messages> allMessages = [];

  Future<void> callAllMessageApi({
    required BuildContext context,
    required String conversationsId,
  }) async {
    try {
      final data = await RemoteService()
          .callGetApi(url: "$qAllConversations/$conversationsId");
      if (data == null) {
        return;
      }
      final allMessageResponse =
          AllMessageModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (allMessageResponse.status == "success" ||
            allMessageResponse.status == 200) {
          allMessages = allMessageResponse.data?.messages ?? [];

          notifyListeners();
          showSnackBar(
            context: context,
            message: allMessageResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: allMessageResponse.message,
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
