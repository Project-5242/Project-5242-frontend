import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/global_members.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/reciver_row.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/sender_row.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: messageList.length,
      itemBuilder: (context, index) => (messageList[index].isSender)
          ? SenderRowView(senderMessage: messageList[index].message)
          : ReceiverRowView(receiverMessage: messageList[index].message),
    );
  }
}
