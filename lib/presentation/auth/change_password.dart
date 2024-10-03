import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  final Widget midleWidget;
  final PreferredSizeWidget? appBar;
  const ChangePasswordScreen(
      {super.key, required this.midleWidget, this.appBar});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;
          return Scaffold(
            appBar: appBar,
            body: midleWidget,
          );
        },
      ),
    );
  }
}
