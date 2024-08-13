import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Favorite View',
          style: context.headlineLarge,
        ),
      ),
    );
  }
}
