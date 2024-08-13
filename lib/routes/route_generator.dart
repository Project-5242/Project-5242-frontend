import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';
import 'package:flutter_project/presentation/auth/forget_password_view.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/auth/register_view.dart';
import 'package:flutter_project/presentation/auth/verify_otp_view.dart';
import 'package:flutter_project/presentation/main/main_view.dart';
import 'package:flutter_project/routes/routes.dart';

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
      case Routes.registerScreen:
        widgetScreen = const RegisterView();
      case Routes.forgetPasswordScreen:
        widgetScreen = const ForgetPasswordView();
      case Routes.verifyOtpScreen:
        widgetScreen = const VerifyOtpView();
      case Routes.changePasswordScreen:
        widgetScreen = const ChangePassword();
      case Routes.mainScreen:
        widgetScreen = const MainView();
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
