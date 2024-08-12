import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlText extends StatelessWidget {
  final String html;

  const HtmlText({super.key, required this.html});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: html,
      onLinkTap: (url, context, _) {},
    );
  }
}
