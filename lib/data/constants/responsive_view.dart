import 'package:flutter/material.dart';

class ResponsiveCheck {
  final BuildContext context;

  ResponsiveCheck(this.context);

  bool get isMobile => MediaQuery.of(context).size.width < 600;

  bool get isTablet =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
}

class ResponsiveView extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveView({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 640) {
        return mobile ?? const ErrorMessage(title: "Need Mobile Widget");
      } else if (constraints.maxWidth >= 640 && constraints.maxWidth < 1200) {
        return tablet ?? const ErrorMessage(title: "Need Tablet Widget");
      } else {
        return desktop ?? const ErrorMessage(title: "Need Desktop Widget");
      }
    }));
  }
}

class ErrorMessage extends StatelessWidget {
  final String title;

  const ErrorMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
