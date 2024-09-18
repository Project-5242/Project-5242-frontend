
class ApiUrls {
  static const String _baseUrl = "https://project5242.zatest.biz/api";
  /// login
  static String loginUrl = "$_baseUrl/auth/login";
  ///register
  static String registerUrl = "$_baseUrl/auth/register";

  /// verify-email
  static String verifyOtpUrl = "$_baseUrl/auth/verify-email";
  /// resend-otp
  static String resendOtpUrl = "$_baseUrl/auth/resend-otp"; 

  /// forgot-password/send-otp
  static String forgotPasswordSendOtpUrl = "$_baseUrl/auth/forgot-password/send-otp";

  /// forgot-password/verify-otp
  static String forgotPasswordVerifyOtpUrl = "$_baseUrl/auth/forgot-password/verify-otp"; 

  ///   change-password
  static String changePasswordUrl = "$_baseUrl/auth/change-password";

  /// auth/update-profile-pic
  static String updateProfilePicUrl = "$_baseUrl/auth/update-profile-pic";  

  /// auth/update-user-profile
  static String updateUserProfileUrl = "$_baseUrl/auth/update-user-profile";      
}