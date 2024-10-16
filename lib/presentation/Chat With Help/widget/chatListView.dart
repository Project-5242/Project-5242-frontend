import 'package:flutter/material.dart';

import '../../../ResponseModel/AllMessageModel.dart';

class ChatListView extends StatelessWidget {
  final ScrollController scrollController;
  final List<Messages> messages; // Updated to accept list of Messages

  const ChatListView({
    Key? key,
    required this.scrollController,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(
          message: message.text ?? "",
          isSentByUser: message.sentByUser ?? false,
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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * 0.75, // Limit bubble width
        ),
        decoration: BoxDecoration(
          color: isSentByUser ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSentByUser
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomRight: isSentByUser
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (senderProfilePhoto.isNotEmpty)
              Row(
                mainAxisAlignment: isSentByUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(senderProfilePhoto),
                    radius: 15,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500, // Use a bolder font
              ),
            ),
            Text(
              senderName,
              style: const TextStyle(
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
