import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/home/dashboard.dart';
import 'package:flutter_project/presentation/message/chat.dart';
import 'package:flutter_project/presentation/message/messages.dart';
import 'package:flutter_project/presentation/savedItems/savedItem_screen.dart';
import 'package:flutter_project/presentation/savedItems/user_detail_screen.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/provider/select_category_view.dart';
import 'package:flutter_project/presentation/settings/setting_view.dart';
import '../presentation/home/notes_widget.dart';
import '../presentation/onboarding/mode_selection_screen.dart';
import '../presentation/onboarding/onboarding_screen.dart';
import '../presentation/onboarding/select_role_screen.dart';
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
        widgetScreen = LoginView();
      case Routes.dashbaord:
        widgetScreen = DashbaordWidget(currentIndex: 0);
      case Routes.savedItemsScreen:
        widgetScreen = const SaveditemScreen();
      case Routes.userDetailScreen:
        widgetScreen = const UserDetailScreen();
      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
      case Routes.selectRoleScreen:
        widgetScreen = SelectRoleScreen();
      case Routes.modeSelectionScreen:
        widgetScreen = ModeSelectionScreen();
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
      case Routes.chatscreen:
        widgetScreen = const ChatScreen();
        break;
      case Routes.messages:
        widgetScreen = const MessageScreen();
        break;
      case Routes.allnotes:
        widgetScreen = const NotesWidget();
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
