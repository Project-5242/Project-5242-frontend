import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/ResponseModel/AllChatUserListModel.dart';
import 'package:flutter_project/ResponseModel/AllMessageModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';

class MessageProvider with ChangeNotifier {
  // Todo Api Call
  bool _isLoadingMessages = false;
  bool _isLoadingSendMessage = false;

  bool get isLoadingMessages => _isLoadingMessages;
  bool get isLoadingSendMessage => _isLoadingSendMessage;
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
  Future<AllMessageModel?> callAllMessageApi({
    required BuildContext context,
    required String conversationsId,
  }) async {
    try {
      // Assuming the loader was shown before this line, remove any related code.
      final data = await RemoteService()
          .callGetApi(url: "$qAllConversations/$conversationsId");

      if (data == null) {
        return null;
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
          return allMessageResponse;
        } else {
          showSnackBar(
            context: context,
            message: allMessageResponse.message,
            isSuccess: false,
          );
          return null;
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
    return null;
  }

// Todo Message Send API
  Future<void> callSendMessageApi({
    required BuildContext context,
    required String receiverId,
    required String messageSend,
  }) async {
    try {
      // Call the API to send the message
      final data = await RemoteService().callPostApi(
        url: qSendMessageApi,
        jsonData: {"receiverId": receiverId, "text": messageSend},
      );

      // Check if data is null
      if (data == null) {
        return;
      }

      // Decode the response
      final Map<String, dynamic> response = jsonDecode(data.body);
      final dynamic status = response['status'];
      final String message = response['message'];

      if (context.mounted) {
        if (status == "success" || status == 200) {
          showSnackBar(
            context: context,
            message: message,
            isSuccess: true,
          );
        } else {
          // Show error message if the status is not success
          showSnackBar(
            context: context,
            message: message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      // Handle exceptions
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
