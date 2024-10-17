import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/MessageProvider.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/chatWithHelpScreen.dart';
import 'package:provider/provider.dart'; // Import the provider here

class AllChatScreen extends StatefulWidget {
  const AllChatScreen({super.key});

  @override
  AllChatScreenState createState() => AllChatScreenState();
}

class AllChatScreenState extends State<AllChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.delayed(Duration.zero, () {
      context.read<MessageProvider>().callAllChatListApi(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
          ),
        ],
      ),
      body: buildMessageList(provider: messageProvider),
    );
  }

  Widget buildMessageList({required MessageProvider provider}) {
    return provider.allChatList.isNotEmpty
        ? ListView.builder(
            itemCount: provider.allChatList.length,
            itemBuilder: (context, index) {
              final message = provider.allChatList[index];
              final lastMessageText =
                  message.lastMessage?.text ?? "No message yet";
              final lastMessageTimestamp = message.lastMessage?.timestamp ?? "";
              log("message-------->$lastMessageTimestamp");
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatWithHelpScreen(
                        message: message,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey)),
                    child: message.receiver?.profilePhoto != null &&
                            message.receiver?.profilePhoto != ""
                        ? Image.network(
                            message.receiver?.profilePhoto ?? "",
                            fit: BoxFit.cover,
                          )
                        : Image.asset(AssetsRes.noProfile, fit: BoxFit.cover),
                  ),
                  title: Text(message.receiver?.fullName ?? 'Unknown User'),
                  subtitle: Text(
                    lastMessageText,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    formatDateTimeToIST(lastMessageTimestamp),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              );
            },
          )
        : Center(
            child: TextWidget(
              textAlign: TextAlign.center,
              text: "No Chat List Found!",
              fontSize: 24,
              color: AppColors.grey,
            ),
          );
  }
}
