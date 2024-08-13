import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile View',
          style: context.headlineLarge,
        ),
      ),
    );
  }
}
