import 'package:flutter/material.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/provider/select_category_view.dart';
import 'package:flutter_project/presentation/settings/setting_view.dart';
import '../presentation/home/home_view.dart';
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
        widgetScreen = const HomeView();
        break;
      case Routes.profileView:
        widgetScreen = const ProfileView();
        break;
      case Routes.editProfileView:
        widgetScreen = const EditProfileView();
        break;
      case Routes.notificationView:
        widgetScreen = const NotificationView();
        break;
      case Routes.settingView:
        widgetScreen = const SettingView();
        break;

      // Provider
      case Routes.selectCategoryView:
        widgetScreen = const SelectCategoryView();
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
