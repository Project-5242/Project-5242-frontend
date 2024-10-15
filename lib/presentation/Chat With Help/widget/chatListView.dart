import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/global_members.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/reciver_row.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/sender_row.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      itemCount: messageList.length,
      itemBuilder: (context, index) => (messageList[index].isSender)
          ? SenderRowView(senderMessage: messageList[index].message)
          : ReceiverRowView(receiverMessage: messageList[index].message),
    );
  }
}
