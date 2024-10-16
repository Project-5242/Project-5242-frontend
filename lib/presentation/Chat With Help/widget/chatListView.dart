import 'package:flutter/material.dart';

import '../../../ResponseModel/AllMessageModel.dart';

class ChatListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<Messages> messages; // Updated to accept list of Messages

  const ChatListView(
      {Key? key, required this.scrollController, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          message: message.text ?? "",
          isSentByUser: message.user?.id ==
              message.receiver?.id, // Check if the message is sent by the user
          senderName: message.user?.fullName ?? "",
          senderProfilePhoto: message.user?.profilePhoto ?? "",
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSentByUser;
  final String senderName;
  final String senderProfilePhoto;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isSentByUser,
    required this.senderName,
    required this.senderProfilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (senderProfilePhoto.isNotEmpty)
              CircleAvatar(
                backgroundImage: NetworkImage(senderProfilePhoto),
                radius: 15,
              ),
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              senderName,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
