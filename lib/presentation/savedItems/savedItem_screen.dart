import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/savedItems/components/empty_comp.dart';
import 'package:flutter_project/presentation/savedItems/components/saved_item_comp.dart';

class SaveditemScreen extends StatefulWidget {
  const SaveditemScreen({super.key});

  @override
  State<SaveditemScreen> createState() => _SaveditemScreenState();
}

class _SaveditemScreenState extends State<SaveditemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SavedItemComp());
  }
}
