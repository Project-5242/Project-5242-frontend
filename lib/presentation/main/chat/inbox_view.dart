import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Messages View',
          style: context.headlineLarge,
        ),
      ),
    );
  }
}
