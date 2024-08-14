import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/routes/routes.dart';

import '../presentation/home/dashboard.dart';
import '../presentation/home/notes_widget.dart';
import '../presentation/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;

    final args = settings.arguments;

    switch (settings.name) {
      case Routes.root:
        widgetScreen = const SplashView();
        break;
      case Routes.loginScreen:
        widgetScreen = const LoginView();
      case Routes.homeScreen:
        widgetScreen =  DashbaordWidget(currentIndex: 0);
        break;
      case Routes.allnotes:
        widgetScreen =  NotesWidget();
        break;
      default:
        widgetScreen = _errorRoute();

    }
    return MaterialPageRoute(
      builder: (_) => widgetScreen,
      settings: settings,
    );
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}
