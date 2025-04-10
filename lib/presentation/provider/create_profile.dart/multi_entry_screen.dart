import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/CreateNodeProvider.dart';
import 'package:flutter_project/data/constants/app_colors.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/data/constants/responsive_view.dart';
import 'package:provider/provider.dart';

class MultiEntryScreen extends StatefulWidget {
  const MultiEntryScreen({super.key});

  @override
  State<MultiEntryScreen> createState() => _MultiEntryScreenState();
}

class _MultiEntryScreenState extends State<MultiEntryScreen> {
  final List<Map<String, dynamic>> entries = [];

  void _addEntry(Map<String, dynamic> entry) {
    setState(() {
      entries.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.multiEntries),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            title: Text(entry['title']),
            subtitle: Text(entry['description']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to entry creation screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return ListTile(
                      title: Text(entry['title']),
                      subtitle: Text(entry['description']),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to entry creation screen
                },
                child: Text(AppStrings.addEntry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}