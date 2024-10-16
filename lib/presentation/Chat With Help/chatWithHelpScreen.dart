import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/MessageProvider.dart';
import 'package:flutter_project/ResponseModel/AllChatUserListModel.dart'; // Import your model
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/chatListView.dart';
import 'package:provider/provider.dart';

import '../../ResponseModel/AllMessageModel.dart';

class ChatWithHelpScreen extends StatefulWidget {
  final AllChatList? message;
  const ChatWithHelpScreen({super.key, this.message});

  @override
  State<ChatWithHelpScreen> createState() => _ChatWithHelpScreenState();
}

class _ChatWithHelpScreenState extends State<ChatWithHelpScreen> {
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Messages> messages = []; // Store the messages here

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final response = await context.read<MessageProvider>().callAllMessageApi(
            context: context,
            conversationsId: widget.message?.conversationId ?? '',
          );

      if (response != null &&
          response.status == "success" &&
          response.data?.messages != null) {
        setState(() {
          messages = response.data!.messages!; // Update messages
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 30),
            TextWidget(
              text: widget.message?.receiver?.fullName ?? "",
              color: AppColors.blue,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ChatListView(
                scrollController: scrollController,
                messages: messages, // Pass messages to ChatListView
              ),
            ),
            Container(
              height: 75,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: 6,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          hintText: 'Write your message',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        String messageText = textEditingController.text.trim();
                        if (messageText.isNotEmpty) {
                          // Add send message logic here
                          textEditingController
                              .clear(); // Clear the input field
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 8, right: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
