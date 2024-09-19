import 'package:flutter_project/base/utils/navigatorService.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user.dart';

/// app storage
class AppGetXStorage {
  const AppGetXStorage._();

  /// instance
  static const AppGetXStorage instance = AppGetXStorage._();

  /// user profile
  static const userData = 'user_data';

  /// token
  static const token = 'token';

  static const deviceOs = 'DEVICE_OS';

  static const FCMToken = 'FCMToken';

  /// is first time
  static const isFirstTime = 'is_first_time';

  /// remember me
  static const _rememberMe = 'remember_me';

  /// save token to storage
  static void saveToken(String tokenText) {
    final box = GetStorage();
    box.write(token, tokenText);
  }

  static void saveFcmToken(String fcmToken) {
    final box = GetStorage();
    box.write(FCMToken, fcmToken);
  }

  static void saveDevice(String device) {
    final box = GetStorage();
    box.write(deviceOs, device);
  }

  /// get token from storage
  static String? getToken() {
    final box = GetStorage();
    return box.read(token);
  }

  /// get fcmtoken from storage
  static String? getFCMToken() {
    final box = GetStorage();
    return box.read(FCMToken);
  }

  static String? getDevice() {
    final box = GetStorage();
    return box.read(deviceOs);
  }

  /// save first time to storage
  static void saveIsFirstTime() {
    final box = GetStorage();
    box.write(isFirstTime, false);
  }

  /// get first time from storage
  static bool getIsFirstTime() {
    final box = GetStorage();
    return box.read(isFirstTime) ?? true;
  }

  /// save user data to storage
  static void saveUserData(UserModel user) {
    final box = GetStorage();
    box.write(userData, user.toJson);
  }

  /// get user data from storage
  static UserModel? getUserData() {
    final box = GetStorage();
    if (box.read(userData) == null) {
      return null;
    }
    return UserModel.fromJson(box.read(userData));
  }

  /// save remember me to storage
  static void saveRememberMe(bool val) {
    final box = GetStorage();
    box.write(_rememberMe, val);
  }

  /// get remember me from storage
  static bool getRememberMe() {
    final box = GetStorage();
    return box.read(_rememberMe) ?? false;
  }

  /// Removes the user data from the storage.
  ///
  /// This function removes the user data from the storage, effectively logging the user out.
  ///
  /// No parameters are required.
  ///
  /// No return value.
  static void logout() {
    final box = GetStorage();
    box.remove(userData);
    box.remove(token);
    Navigatorservice.pushNamedAndRemoveUntil(Routes.root);
  }
}
