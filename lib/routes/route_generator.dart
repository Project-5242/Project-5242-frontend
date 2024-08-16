import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/auth/change_password.dart';
import 'package:flutter_project/presentation/auth/forget_password.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/auth/new_password_screen.dart';
import 'package:flutter_project/presentation/auth/sign_up.dart';
import 'package:flutter_project/presentation/onboarding/mode_selection_screen.dart';
import 'package:flutter_project/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_project/presentation/onboarding/select_role_screen.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile1.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile2.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/ctreate_profile3.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile1.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile2.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile3.dart';
import 'package:flutter_project/presentation/provider/edit_update/edit_profile4.dart';
import 'package:flutter_project/presentation/savedItems/savedItem_screen.dart';
import 'package:flutter_project/presentation/savedItems/user_detail_screen.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/presentation/provider/select_category_view.dart';
import 'package:flutter_project/presentation/settings/setting_view.dart';
import '../presentation/auth/otp_screen.dart';
import '../presentation/home/home_view.dart';
import '../presentation/provider/create_profile.dart/create_profile4.dart';
import '../presentation/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;

    final args = settings.arguments;

    switch (settings.name) {
      case Routes.root:
        widgetScreen = const SplashView();
        // widgetScreen = const SplashView();
        break;
      case Routes.loginScreen:
        widgetScreen = LoginView();
      case Routes.signUp:
        widgetScreen = const SignUp();
      case Routes.forgetPassword:
        widgetScreen = ForgetPassword();
      case Routes.otpScreen:
        widgetScreen = OtpScreen();
      case Routes.newPassword:
        widgetScreen = const NewPasswordScreen();
      case Routes.homeScreen:
        widgetScreen = const HomeView();
      case Routes.savedItemsScreen:
        widgetScreen = const SaveditemScreen();
      case Routes.userDetailScreen:
        widgetScreen = const UserDetailScreen();
      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
      case Routes.selectRoleScreen:
        widgetScreen = SelectRoleScreen();
      case Routes.modeSelectionScreen:
        widgetScreen = const ModeSelectionScreen();
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
      case Routes.createProfile:
        widgetScreen = const CreateProfile();
      case Routes.createProfile1:
        widgetScreen = const CreateProfile1();
      case Routes.createProfile2:
        widgetScreen = const CreateProfile2(
          currentIndex: 1,
          totalSteps: 3,
        );
      case Routes.createProfile3:
        widgetScreen = const CreateProfile3(
          currentIndex: 2,
          totalSteps: 3,
        );
      case Routes.createProfile4:
        widgetScreen = const CreateProfile4();
      case Routes.editProfile1:
        widgetScreen = EditProfile1();
      case Routes.editProfile2:
        widgetScreen = const EditProfile2();
      case Routes.editProfile3:
        widgetScreen = const EditProfile3();
      case Routes.editProfile4:
        widgetScreen = const EditProfile4();
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
