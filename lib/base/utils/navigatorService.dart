import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

class Navigatorservice {
   /// Push to new route name
  static Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
    if (!_isSameRoute(routeName)) {
      return Routes.navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
    }
    return null;
  }

  /// Back to previous page
  static void goBack() {
    Routes.navigatorKey.currentState?.pop();
  }

  /// Push and remove all other routes
  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool Function(Route<dynamic>)? routePredicate, dynamic arguments}) async {
    if (!_isSameRoute(routeName)) {
      return Routes.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, 
        routePredicate ?? (Route<dynamic> route) => false,
        arguments: arguments,
      );
    }
    return null;
  }

  /// Push and replace current route
  static Future<dynamic> popAndPushNamed(String routeName, {dynamic arguments}) async {
    if (!_isSameRoute(routeName)) {
      return Routes.navigatorKey.currentState?.popAndPushNamed(routeName, arguments: arguments);
    }
    return null;
  }

  /// Private method to check if the current route is the same as the new route
  static bool _isSameRoute(String routeName) {
    return ModalRoute.of(Routes.navigatorKey.currentContext!)?.settings.name == routeName;
  }
}