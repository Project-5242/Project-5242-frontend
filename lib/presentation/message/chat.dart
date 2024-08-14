import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/res/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      text:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
        messages.add(Message(
          text: messageController.text,
          isSentByMe: true,
          time: formattedTime,
        ));
        messageController
            .clear(); // Clear the text field after sending a message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/girl2.png',
                  height: 44.h, width: 44.w, fit: BoxFit.cover),
            ),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: PopupMenuButton(
              onSelected: (value) =>
                  _handlePopUpItem(value.toString(), context),
              constraints: BoxConstraints(
                maxWidth: 145.w,
              ),
              itemBuilder: (BuildContext context) {
                return {"Block", 'Report', 'Remove'}.map((String choice) {
                  return PopupMenuItem(
                    value:
                    choice.toLowerCase(), // Correct usage of toLowerCase()
                    child: Container(
                      height: 40.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                          choice,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: InkWell(
                        onTap: () {
                         /* Get.to(MycontractScreen());*/
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: message.isSentByMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 200.w),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: message.isSentByMe
                                      ? BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r),
                                    bottomLeft: Radius.circular(15.r),
                                  )
                                      : BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child: Text('hi'),/*TextWidget(
                                  text: message.text,
                                  color: Colors.white,
                                  size: 12.sp,
                                  fontweight: FontWeight.w400,
                                ),*/
                              ),
                              SizedBox(
                                  height: 5
                                      .h), // Adjusts spacing between message and time
                              Text('hi'),/*TextWidget(
                                text: message.time,
                                color: Colors.black.withOpacity(0.7),
                                size: 10.sp,
                              ),*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      /*Get.to(MycontractScreen());*/
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: const Color(0xffF1F1F1),
                      ),
                      height: 50.h,
                      width: 234.w,
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                          fillColor: const Color(0xffF1F1F1),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              Assets.person,
                              height: 18.h,
                              width: 18.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          hintText: 'Type Something....',
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 71.w,
                    child: IconButton(
                      onPressed: () {
                        _sendMessage();
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: const Color(0xffB9B9B9),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F1F1),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handlePopUpItem(String value, context) {
    switch (value) {
      case 'block':
        _showDialogBox(
            context, 'Do you want to Block ', 'Joseph Aina ?', 'Yes', 'No');
        break;
      case 'report':
        _showDialogBox(context, 'Do you want to Report ', 'Joseph Aina ?',
            'Report', 'Cancel');
        break;
      case 'remove':
        _showDialogBox(context, 'Do you want to Remove ', 'Joseph Aina ?',
            'Remove', 'Cancel');
        break;
    }
  }

  void _showDialogBox(
      BuildContext context,
      String text,
      String text1,
      String btntext1,
      String btntext2,
      ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: Text('hi'),/*TextWidget(
                  text: 'Are you Sure?',
                  color: Colors.blue,
                  size: 20.sp,
                  fontweight: FontWeight.w700,
                ),*/
              ),
              content: RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      //recognizer: TapGestureRecognizer()

                      text: text1,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // TextWidget(
              //   text: text,
              //   color: MyColors.black,
              //   size: 12,
              //   fontweight: FontWeight.w500,
              // ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.lightBlue),
                          )),
                      onPressed: () {
                      /*  Get.back();*/
                      },
                      child: Text('hi'),/*TextWidget(
                        text: btntext1,
                        color: Colors.white,
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),*/
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(100),
                          )),
                      onPressed: () {
                      /*  Get.back();*/
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('hi'),/*TextWidget(
                          text: btntext2,
                          color: Colors.black,
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),*/
                      ),
                    ),
                  ],
                )
              ]);
        });
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final String time;

  Message({required this.text, required this.isSentByMe, required this.time});
}
