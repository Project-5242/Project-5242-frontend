import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      text:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the text ever since the 1500s, when an unknown.",
      isSentByMe: false,
      time: '1:30 PM',
    ),
    Message(
      text:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      isSentByMe: true,
      time: '1:30 PM',
    ),
    Message(
      text:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the text ever since the 1500s, when an unknown.",
      isSentByMe: false,
      time: '1:30 PM',
    ),
  ];

  TextEditingController messageController = TextEditingController();

  void _handlePopUpItem(String value, BuildContext context) {
    // Handle popup menu actions (Block, Report, Remove)
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery data for screen dimensions
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.015,
              vertical: screenHeight * 0.005,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/person.png',
                height: screenHeight * 0.05,
                width: screenWidth * 0.1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Jason Jones',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B8FAC),
            ),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) =>
                  _handlePopUpItem(value.toString(), context),
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.4,
              ),
              itemBuilder: (BuildContext context) {
                return {"Block", 'Report', 'Remove'}.map((String choice) {
                  return PopupMenuItem(
                    value: choice.toLowerCase(),
                    child: Container(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF0B8FAC),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.025,
                          vertical: screenHeight * 0.006,
                        ),
                        child: Text(
                          choice,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.007,
                      ),
                      child: Column(
                        crossAxisAlignment: message.isSentByMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints:
                            BoxConstraints(maxWidth: screenWidth * 0.7),
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: message.isSentByMe
                                  ? Color(0xFF0B8FAC)
                                  : Color(0xFF0B8FAC),
                              borderRadius: message.isSentByMe
                                  ? BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )
                                  : BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.006),
                          Text(
                            message.time,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.012,
                          horizontal: screenWidth * 0.04,
                        ),
                        fillColor: Color(0xFF0B8FAC),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                          size: screenWidth * 0.07,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Colors.white,
                                size: screenWidth * 0.07,
                              ),
                              onPressed: () {
                                // Handle file attachment
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: screenWidth * 0.07,
                              ),
                              onPressed: () {
                                // Handle camera action
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final String time;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}
