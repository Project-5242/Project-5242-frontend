import 'package:flutter/material.dart';

import 'catogory.dart';

class MessageChatScreen1 extends StatefulWidget {
  const MessageChatScreen1({super.key});

  @override
  State<MessageChatScreen1> createState() => _MessageChatScreen1State();
}

class _MessageChatScreen1State extends State<MessageChatScreen1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {

              },
              child: Icon(Icons.arrow_back_outlined),
            ),
            SizedBox(width: 20),
           const Text(
              'Messages',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Favorite'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
         child:Row(
              children: [
                Expanded(
                  flex: 3,
                    child:Container(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 50),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Recent Message',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // Message list
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Catagory1(),
                                  Catagory1(),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(width: 10),

                Expanded(
                  flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ChatScreen1(),
                      ),
                    ),
                  ),
              ],
            ),

      ),
    );
  }
}







class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({super.key});

  @override
  State<ChatScreen1> createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {
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

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.all(8.0), // Fixed padding for the profile picture
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/person.png',
                height: 40, // Fixed height
                width: 40, // Fixed width
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'Jason Jones',
            style: TextStyle(
              fontSize: 20, // Fixed font size
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B8FAC),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => _handlePopUpItem(value, context),
              constraints: BoxConstraints(
                maxWidth: 120, // Fixed width
              ),
              itemBuilder: (BuildContext context) {
                return {"Block", "Report", "Remove"}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice.toLowerCase(),
                    child: Container(
                      height: 30, // Fixed height
                      width: 100, // Fixed width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF0B8FAC),
                      ),
                      child: Center(
                        child: Text(
                          choice,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, // Fixed font size
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
            SizedBox(height: 10,),
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
                        horizontal: 8, // Fixed padding
                        vertical: 4, // Fixed padding
                      ),
                      child: Column(
                        crossAxisAlignment: message.isSentByMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            padding: EdgeInsets.all(8),
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
                                color: Colors.black, // Changed text color for better readability
                                fontSize: 14, // Fixed font size
                              ),
                            ),
                          ),
                          SizedBox(height: 2), // Fixed space between message and time
                          Text(
                            message.time,
                            style: TextStyle(
                              fontSize: 10, // Fixed font size
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
              padding: const EdgeInsets.symmetric(
                horizontal: 8, // Fixed padding
                vertical: 8, // Fixed padding
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8, // Fixed padding
                          horizontal: 12, // Fixed padding
                        ),
                        fillColor: Color(0xFF0B8FAC),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon:const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                          size: 24, // Fixed icon size
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.attach_file,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                // Handle file attachment
                              },
                            ),
                            IconButton(
                              icon:const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {

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
  final bool isFavorite;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.time,
    this.isFavorite = false,
  });
}





