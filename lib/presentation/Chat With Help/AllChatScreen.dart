import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/MessageProvider.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          isScrollable: false,
          indicatorPadding: EdgeInsets.zero,
          controller: _tabController,
          indicatorColor: Colors.teal,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          labelPadding:
              const EdgeInsets.symmetric(horizontal: 40.0), // Add padding here
          tabs: const [
            Tab(
              child: Text(
                'All',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildMessageList(provider: messageProvider),
          buildMessageList(provider: messageProvider),
        ],
      ),
    );
  }

  Widget buildMessageList({required MessageProvider provider}) {
    return provider.allChatList.isNotEmpty
        ? ListView.builder(
            itemCount: provider.allChatList.length,
            itemBuilder: (context, index) {
              final message = provider.allChatList[index];

              // Handle the case where lastMessage is null
              final lastMessageText =
                  message.lastMessage?.text ?? "No message yet";
              final lastMessageTimestamp = message.lastMessage?.timestamp ?? "";

              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: message.receiver?.profilePhoto != null &&
                          message.receiver?.profilePhoto == ""
                      ? NetworkImage(message.receiver?.profilePhoto ?? "")
                      : const AssetImage(AssetsRes.noProfile) as ImageProvider,
                ),
                title: Text(message.receiver?.fullName ?? 'Unknown User'),
                subtitle: Text(lastMessageText),
                trailing: Text(
                  lastMessageTimestamp,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              );
            },
          )
        : TextWidget(
            text: "No Chat List Found!",
            fontSize: 24,
            color: AppColors.grey,
          );
  }
}
