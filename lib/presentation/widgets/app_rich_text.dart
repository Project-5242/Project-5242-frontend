import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';
import 'package:flutter_project/presentation/auth/sign_up.dart';
import 'package:get/get.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final String text1;
  final VoidCallback onTap;
  final Color color;
  final Color color1;
  final double size;
  final TextDecoration? decoration;
  const RichTextWidget(
      {super.key,
      required this.text,
      required this.text1,
      required this.onTap,
      required this.color,
      required this.color1,
      this.decoration,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text,
        style: context.customFont('Open Sans', size, FontWeight.w400, color),
        children: <TextSpan>[
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: text1,
              style: TextStyle(
                  fontSize: size,
                  color: color1,
                  fontWeight: FontWeight.w400,
                  decoration: decoration)
              //  context.withDecoration(
              //     12.0, FontWeight.w400, TextDecoration.underline,)
              )
          //customFont('Open Sans', 12.0, , color1),
        ],
      ),
    );
  }
}
