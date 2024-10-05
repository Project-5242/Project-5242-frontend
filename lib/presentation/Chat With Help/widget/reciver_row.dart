import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';

class ReceiverRowView extends StatelessWidget {
  ReceiverRowView({Key? key, required this.receiverMessage}) : super(key: key);
  final String receiverMessage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AssetsRes.noProfile),
        ),
      ),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextWidget(
          text: "Tele Caller",
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: Border.all(color: AppColors.greyDivider),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12)),
          ),
          child: TextWidget(
            text: receiverMessage,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ]),
      subtitle: const Padding(
        padding: EdgeInsets.only(left: 8, top: 4),
        child: TextWidget(
          text: "09:25 AM",
          fontSize: 11,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
