import 'package:flutter/material.dart';

class EmptyComp extends StatelessWidget {
  const EmptyComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'No Saved Items!',
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            'You don’t have any saved items. Go to home and add some.',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
