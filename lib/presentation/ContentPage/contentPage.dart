import 'package:flutter/material.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/ContentProvider.dart';
import 'package:flutter_project/base/helpers/textwidget.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  final String name;

  const ContentPage({super.key, required this.name});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<ContentProvider>().callContentApi(
            context: context,
            type: widget.name == "Privacy & Policy"
                ? "privacyPolicy"
                : "termsAndConditions",
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(
      builder: (context, provider, child) {
        if (provider.respone == null) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: TextWidget(
                text: widget.name,
                fontSize: 20,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (provider.respone['data'] == null ||
            (widget.name == "Privacy & Policy"
                ? provider.respone['data']['privacyPolicy'] == null
                : provider.respone['data']['termsAndConditions'] == null)) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: TextWidget(
                text: widget.name,
                fontSize: 20,
              ),
            ),
            body: const Center(
              child: TextWidget(
                text: "No data available.",
                fontSize: 14,
              ),
            ),
          );
        }
        String content = widget.name == "Privacy & Policy"
            ? provider.respone['data']['privacyPolicy']
            : provider.respone['data']['termsAndConditions'];
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: TextWidget(
              text: widget.name,
              fontSize: 20,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: TextWidget(
              text: content,
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
