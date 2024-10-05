import 'package:flutter/material.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/ChatMessagesModel.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/chatListView.dart';
import 'package:flutter_project/presentation/Chat%20With%20Help/widget/global_members.dart';

class ChatWithHelpScreen extends StatefulWidget {
  const ChatWithHelpScreen({super.key});

  @override
  State<ChatWithHelpScreen> createState() => _ChatWithHelpScreenState();
}

class _ChatWithHelpScreenState extends State<ChatWithHelpScreen> {
  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;
  ScrollController scrollController = ScrollController();

  final List<String> channelMessages = [];
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
        () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextWidget(
              text: "Message",
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: ChatListView(scrollController: scrollController)),
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
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 8),
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          hintText: 'Write your message',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          messageList.add(
                              MessageData(textEditingController.text, true));
                          textEditingController.clear();
                          scrollAnimation();
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          messageList.add(
                              MessageData(textEditingController.text, false));
                          textEditingController.clear();
                          scrollAnimation();
                        });
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
