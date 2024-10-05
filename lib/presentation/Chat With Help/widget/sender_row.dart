import 'package:flutter/material.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';

class SenderRowView extends StatelessWidget {
  SenderRowView({Key? key, required this.senderMessage}) : super(key: key);

  final String senderMessage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
      ),
      visualDensity: VisualDensity.comfortable,
      title: Wrap(alignment: WrapAlignment.end, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: TextWidget(
            text: senderMessage,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.white,
            softWrap: true,
          ),
        ),
      ]),
      subtitle: const Padding(
        padding: EdgeInsets.only(right: 8, top: 4),
        child: Text(
          '10:03 AM',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
