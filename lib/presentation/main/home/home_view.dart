import 'package:flutter/material.dart';
import 'package:flutter_project/base/extensions/text_style_extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home View',
          style: context.headlineLarge,
        ),
      ),
    );
  }
}
