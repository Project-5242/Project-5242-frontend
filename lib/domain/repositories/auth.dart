import 'package:flutter_project/data/dataSource/http_source.dart';
import 'package:flutter_project/data/models/user.dart';

import '../../base/utils/app_utils.dart';
import '../apiUrls.dart';

class AuthRepository {
  AuthRepository._();
  /// prvate constructor
  static final AuthRepository _instance = AuthRepository._();
  /// singleton
  static AuthRepository get instance => _instance;
  final HttpService _httpService = HttpService.instance;

  /// login
  Future<bool> login({required String email,required String password}) async {
    final result = await _httpService.postRequest(
      ApiUrls.loginUrl,
      body: {'email': email, 'password': password},

    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }

  /// register
  Future<bool> register({required UserModel user}) async {
    final result = await _httpService.postRequest(
      ApiUrls.registerUrl,
      body: user.toJson,
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }
  // /// verify-email
  // static String verifyOtpUrl = "$_baseUrl/auth/verify-email";
  // /// resend-otp
  // static String resendOtpUrl = "$_baseUrl/auth/resend-otp"; 

  // /// forgot-password/send-otp
  // static String forgotPasswordSendOtpUrl = "$_baseUrl/auth/forgot-password/send-otp";

  // /// forgot-password/verify-otp
  // static String forgotPasswordVerifyOtpUrl = "$_baseUrl/auth/forgot-password/verify-otp"; 

  // ///   change-password
  // static String changePasswordUrl = "$_baseUrl/auth/change-password";

  // /// auth/update-profile-pic
  // static String updateProfilePicUrl = "$_baseUrl/auth/update-profile-pic";  

  // /// auth/update-user-profile
  // static String updateUserProfileUrl = "$_baseUrl/auth/update-user-profile";   
  /// need complete all api url
  
  /// verify email
  Future<bool> verifyEmail({required String email,required String otp}) async {
    final result = await _httpService.postRequest(
      ApiUrls.verifyOtpUrl,
      body: {'email': email, 'otp': otp},
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }

  /// resend otp
  Future<bool> resendOtp({required String email}) async {
    final result = await _httpService.postRequest(
      ApiUrls.resendOtpUrl,
      body: {'email': email},
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }
  /// forgot password
  Future<bool> forgotPasswordSendOtp({required String email}) async {
    final result = await _httpService.postRequest(
      ApiUrls.forgotPasswordSendOtpUrl,
      body: {'email': email},
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }

  /// change password
  Future<bool> changePassword({required String email,required String password}) async {
    final result = await _httpService.postRequest(
      ApiUrls.changePasswordUrl,
      body: {'email': email, 'password': password},
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }

  /// update profile
  
  Future<bool> updateProfile({required UserModel user}) async {
    final result = await _httpService.postRequest(
      ApiUrls.updateUserProfileUrl,
      body: user.toJson,
      // headers: {
      //   'Content-Type': 'application/json',
      //   'token': 'application/json',
      // }
    );
    if (result.isSuccess) {
      AppUtils.showToast(message: result.json['message']);
      return true;
    } else {
      AppUtils.showToast(message: result.json['message'],error: true);
      return false;
    }
  }

}
