import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ResponseModel/CategoriesResponseModel.dart';
import 'package:flutter_project/ResponseModel/GetUserDetailModel.dart';
import 'package:flutter_project/ResponseModel/commonAuthModel.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/base/Remote/remote_service.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:flutter_project/presentation/auth/new_password_screen.dart';
import 'package:flutter_project/presentation/auth/otp_screen.dart';
import 'package:flutter_project/presentation/home/BottomNavBarProvider.dart';
import 'package:flutter_project/presentation/onboarding/select_role_screen.dart';
import 'package:flutter_project/presentation/provider/create_profile.dart/create_profile.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/routes.dart';

class SignUpProvider extends ChangeNotifier {
  // Class variables
  String? _otpValue;
  File? _selectedImage;
  String? _profileImageUpdate;
  int _currentStep = 1;
  final int _totalSteps = 3;
  CommonAuthModel commonAuthModel = CommonAuthModel();
  GetUserDetailModel getUserDetailModel = GetUserDetailModel();
  List<CategoriesList> categoriesList = [];
  int currentPage = 1;
  int totalPages = 1;
  ScrollController scrollController = ScrollController();
  int selectedCategoryIndex = -1;

  // Getters
  String? get otpValue => _otpValue;
  File? get selectedImage => _selectedImage;
  String? get profileImageUpdate => _profileImageUpdate;
  int get currentStep => _currentStep;
  int get totalSteps => _totalSteps;

  // Setters
  set otpValue(String? value) {
    _otpValue = value;
    notifyListeners();
  }

  set selectedImage(File? value) {
    _selectedImage = value;
    notifyListeners();
  }

  set profileImageUpdate(String? value) {
    _profileImageUpdate = value;
    notifyListeners();
  }

  set currentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  // Init method
  void init() {
    allCategoryApi(context: Routes.navigatorKey.currentContext!);
  }

  // SignUp API
  Future<void> callSignUpUserApi({
    required BuildContext context,
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String bio, File? profilePhoto,
  }) async {
    try {
      if (selectedImage == null) {
        showSnackBar(
          context: context,
          message: 'Profile photo is required. Please select an image to continue.',
          isSuccess: false,
        );
        return;
      }
      
      // Validate bio length (minimum 3 characters)
      final String bioToUse = bio.trim();
      if (bioToUse.length < 3) {
        showSnackBar(
          context: context,
          message: 'Bio must be at least 3 characters long.',
          isSuccess: false,
        );
        return;
      }
      
      print('Bio validation passed');
      print('Final bio value being sent: $bioToUse');
      print('Final bio length: ${bioToUse.length}');
      
      // Validate the selected image
      try {
        if (!await selectedImage!.exists()) {
          showSnackBar(
            context: context,
            message: 'The selected image could not be found. Please try selecting again.',
            isSuccess: false,
          );
          return;
        }
        
        // Validate file type
        final String extension = selectedImage!.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png'].contains(extension)) {
          showSnackBar(
            context: context,
            message: 'Only JPG, JPEG or PNG images are supported. Please select a valid image.',
            isSuccess: false,
          );
          return;
        }

        // Validate file size (max 5MB)
        final int fileSize = await selectedImage!.length();
        if (fileSize > 5 * 1024 * 1024) {
          showSnackBar(
            context: context,
            message: 'Image size must be less than 5MB. Please choose a smaller file.',
            isSuccess: false,
          );
          return;
        }

        // Test file readability
        await selectedImage!.openRead().first;
      } catch (e) {
        showSnackBar(
          context: context,
          message: 'Error accessing profile photo: ${e.toString()}',
          isSuccess: false,
        );
        return;
      }

      Map<String, String> requestBody = {
        "fullName": fullName,
        "password": password,
        "email": email,
        "mobileNumber": mobileNumber,
        "bio": bio, // Use the bio exactly as provided
        "fcmToken": (sharedPrefs?.getString(AppStrings.fcmToken) ?? "Fcm Token"),
        "isProvider": "false",
      };

      final data = await RemoteService().callMultipartApi(
        url: qRegister,
        requestBody: requestBody,
        file: selectedImage!,
        fileParamName: 'profilePhoto',
      );
      if (data == null) {
        print('SignUp API failed: No data received');
        return;
      }
      print('SignUp API response status: ${data.statusCode}');
      print('SignUp API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));

      if (context.mounted) {
        if (commonAuthResponse.status == 201) {
          commonAuthModel = commonAuthResponse;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                whereComeTo: "signup",
                email: email,
              ),
            ),
          );
          print('SignUp successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else if (commonAuthResponse.status == 400) {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in signUpApi: $e');
      if (e is DioException) {
        print('Error details: ${e.response?.statusCode} - ${e.response?.data}');
      }
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'Error occurred while communicating with the server: ${e is DioException ? e.response?.statusCode ?? 'Unknown' : 'Unknown'}',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Category API
  CategoriesResponseModel categoriesResponseModel = CategoriesResponseModel();

  Future<void> allCategoryApi({required BuildContext context}) async {
    try {
      final data = await RemoteService()
          .callGetApi(url: "$qAllCategory?page=$currentPage");
      if (data == null) {
        print('Category API failed: No data received');
        return;
      }
      print('Category API response status: ${data.statusCode}');
      print('Category API response body: ${data.body}');
      final categoriesResponse =
          CategoriesResponseModel.fromJson(jsonDecode(data.body));

      if (context.mounted) {
        if (categoriesResponse.status == 200) {
          if (currentPage == 1) {
            categoriesList.clear();
          }
          categoriesList.addAll(categoriesResponse.data?.categoriesList ?? []);
          totalPages = categoriesResponse.data?.pagination?.total ?? 1;
          notifyListeners();

          showSnackBar(
            context: context,
            message: categoriesResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: categoriesResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in allCategoryApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
  }

  // OTP Verify API
  Future<void> verifyOtpApi({
    required BuildContext context,
    required String email,
    required String otp,
    String? roleType,
  }) async {
    try {
      final data =
          await RemoteService().callPostApi(url: qVerifyEmail, jsonData: {
        "email": email,
        "otp": otp,
      });
      if (data == null) {
        print('OTP Verify API failed: No data received');
        return;
      }
      print('OTP Verify API response status: ${data.statusCode}');
      print('OTP Verify API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == 200) {
          commonAuthModel = commonAuthResponse;
          sharedPrefs?.setString(
              AppStrings.token, commonAuthResponse.token ?? "");
          sharedPrefs?.setBool(AppStrings.isLogin, true);

          sharedPrefs?.setBool(AppStrings.isProvider,
              commonAuthResponse.data?.isProvider ?? false);

          final isProvider = commonAuthResponse.data?.isProvider ?? false;

          // Navigate based on role type or isProvider flag
          final isProfileComplete = sharedPrefs?.getBool(AppStrings.isProfileComplete) ?? false;
            if (roleType == "provider" || isProvider) {
              if (isProfileComplete) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBarProvider(
                      whereComeTo: "provider",
                    ),
                  ),
                  (route) => false,
                );
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const CreateProfile(),
                  ),
                  (route) => false,
                );
              }
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const BottomNavBarProvider(),
              ),
              (route) => false,
            );
          }

          showSnackBar(
            context: context,
            message: "Logged in successfully",
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in verifyOtpApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Image picker
  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      
      if (image != null) {
        // Create a new File instance and verify it exists
        final newImage = File(image.path);
        if (await newImage.exists()) {
          // Additional check for file readability
          try {
            await newImage.openRead().first;
            selectedImage = newImage;
            profileImageUpdate = image.path;
            notifyListeners();
            if (Routes.navigatorKey.currentContext != null) {
              showSnackBar(
                context: Routes.navigatorKey.currentContext!,
                message: 'Profile photo selected successfully',
                isSuccess: true,
              );
            }
          } catch (e) {
            if (Routes.navigatorKey.currentContext != null) {
              showSnackBar(
                context: Routes.navigatorKey.currentContext!,
                message: 'Error reading selected image. Please try another file.',
                isSuccess: false,
              );
            }
          }
        } else {
          if (Routes.navigatorKey.currentContext != null) {
            showSnackBar(
              context: Routes.navigatorKey.currentContext!,
              message: 'Selected photo does not exist',
              isSuccess: false,
            );
          }
        }
      }
    } catch (e) {
      print('Error picking image: $e');
      if (Routes.navigatorKey.currentContext != null) {
        showSnackBar(
          context: Routes.navigatorKey.currentContext!,
          message: 'Error selecting image: $e',
          isSuccess: false,
        );
      }
    }
  }

  // Resend OTP API
  Future<void> callResendOtpApi({
    required BuildContext context,
    required String email,
    String? roleType,
  }) async {
    try {
      final data =
          await RemoteService().callPostApi(url: qResendOtp, jsonData: {
        "email": email,
      });
      if (data == null) {
        print('Resend OTP API failed: No data received');
        return;
      }
      print('Resend OTP API response status: ${data.statusCode}');
      print('Resend OTP API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == "success") {
          commonAuthModel = commonAuthResponse;
          print('Resend OTP successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callResendOtpApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Update Profile API
  Future<void> callUpdateProfileDetailApi({
    required BuildContext context,
    required String phone,
    required String fullName,
    String? bio,
    File? profilePhoto,
  }) async {
    try {
      // Use the provided bio after trimming
      String bioToUse = bio?.trim() ?? "";

      Map<String, String> requestBody = {
        "mobileNumber": phone,
        "fullName": fullName,
        "bio": bioToUse,
      };

      final data = profilePhoto != null
          ? await RemoteService().callMultipartApi(
              url: qUpdateProfile,
              requestBody: requestBody,
              file: profilePhoto,
              fileParamName: 'profilePhoto',
            )
          : await RemoteService().callPutApi(
              url: qUpdateProfile,
              jsonData: requestBody,
            );

      if (data == null) {
        showSnackBar(
          context: context,
          message: 'Failed to update profile. Please try again.',
          isSuccess: false,
        );
        return;
      }

      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));

      print("Response Body: ${data.body}");

      if (context.mounted) {
        if (commonAuthResponse.status == 200) {
          commonAuthModel = commonAuthResponse;
          sharedPrefs?.setString(
              AppStrings.userName, commonAuthResponse.data?.fullName ?? "");
          sharedPrefs?.setString(
              AppStrings.userEmail, commonAuthResponse.data?.email ?? "");
          sharedPrefs?.setString(AppStrings.userMobile,
              commonAuthResponse.data?.mobileNumber ?? "");

          Navigator.of(context).pop();

          print('Profile update successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          // Handle error or specific error messages
          showSnackBar(
            context: context,
            message: commonAuthResponse.message ?? 'Unexpected error occurred.',
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callUpdateProfileDetailApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    } finally {
      notifyListeners();
    }
  }

  // Login API
  Future<void> callLoginApi({
    required BuildContext context,
    required String email,
    required String password,
    String? roleType,
  }) async {
    try {
      final data = await RemoteService().callPostApi(
        url: qLogin,
        jsonData: {
          "email": email,
          "password": password,
          "fcmToken": sharedPrefs?.getString(AppStrings.fcmToken) ?? "",
        },
      );

      if (data == null) {
        showSnackBar(
          context: context,
          message: 'Email is not verified. Please verify your email.',
          isSuccess: false,
        );
        return;
      }

      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));

      print("Response Body: ${data.body}");

      if (context.mounted) {
        if (commonAuthResponse.status == "200") {
          commonAuthModel = commonAuthResponse;
          sharedPrefs?.setString(
              AppStrings.token, commonAuthResponse.token ?? "");
          sharedPrefs?.setString(
              AppStrings.userName, commonAuthResponse.data?.fullName ?? "");
          sharedPrefs?.setString(
              AppStrings.userEmail, commonAuthResponse.data?.email ?? "");
          sharedPrefs?.setString(
              AppStrings.userMobile,
              commonAuthResponse.data?.mobileNumber ?? "");
          sharedPrefs?.setBool(AppStrings.isLogin, true);
          sharedPrefs?.setBool(AppStrings.isProvider,
              commonAuthResponse.data?.isProvider ?? false);

          final isProvider = commonAuthResponse.data?.isProvider ?? false;

          // Navigate based on role type or isProvider flag
          final isProfileComplete = sharedPrefs?.getBool(AppStrings.isProfileComplete) ?? false;
            if (roleType == "provider" || isProvider) {
              if (isProfileComplete) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBarProvider(
                      whereComeTo: "provider",
                    ),
                  ),
                  (route) => false,
                );
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const CreateProfile(),
                  ),
                  (route) => false,
                );
              }
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const BottomNavBarProvider(),
              ),
              (route) => false,
            );
          }

          print('Login successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          // Handle error or specific error messages
          showSnackBar(
            context: context,
            message: commonAuthResponse.message ?? 'Unexpected error occurred.',
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callLoginApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    } finally {
      notifyListeners();
    }
  }

  // Forgot Password API
  Future<void> callForgotPasswordApi({
    required BuildContext context,
    required String email,
    String? roleType,
  }) async {
    try {
      final data =
          await RemoteService().callPostApi(url: qForgotPassword, jsonData: {
        "email": email,
      });
      if (data == null) {
        print('Forgot Password API failed: No data received');
        return;
      }
      print('Forgot Password API response status: ${data.statusCode}');
      print('Forgot Password API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == "success") {
          commonAuthModel = commonAuthResponse;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                email: email,
              ),
            ),
          );
          print('Forgot Password successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callForgotPasswordApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Forgot OTP Verify API
  Future<void> callForgotVerifyOtpApi({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    try {
      final data = await RemoteService()
          .callPostApi(url: qForgotPasswordVerifyOtp, jsonData: {
        "email": email,
        "otp": otp,
      });
      if (data == null) {
        print('Forgot OTP Verify API failed: No data received');
        return;
      }
      print('Forgot OTP Verify API response status: ${data.statusCode}');
      print('Forgot OTP Verify API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == "success") {
          commonAuthModel = commonAuthResponse;
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => NewPasswordScreen(
                      email: email,
                    )),
            (route) => false,
          );
          print('Forgot OTP Verify successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callForgotVerifyOtpApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Reset Password API
  Future<void> callRestPasswordApi({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final data =
          await RemoteService().callPutApi(url: qRestPassword, jsonData: {
        "email": email,
        "newPassword": password,
      });
      if (data == null) {
        print('Reset Password API failed: No data received');
        return;
      }
      print('Reset Password API response status: ${data.statusCode}');
      print('Reset Password API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == 200) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) => false,
          );
          print('Reset Password successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callRestPasswordApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Logout API
  Future<void> callLogout({
    required BuildContext context,
  }) async {
    sharedPrefs?.remove(AppStrings.token);
    sharedPrefs?.remove(AppStrings.fullName);
    sharedPrefs?.remove(AppStrings.email);
    sharedPrefs?.remove(AppStrings.mobilenumber);
    sharedPrefs?.remove(AppStrings.userImage);
    sharedPrefs?.setBool(AppStrings.isLogin, false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SelectRoleScreen()),
        (route) => false);
    notifyListeners();
    showSnackBar(
        context: context, message: 'Logged out successfully', isSuccess: true);
    notifyListeners();
  }

  // Get User Details API
  Future<void> callGetUserDetailsApi({
    required BuildContext context,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: qGetUserDetail);
      if (data == null) {
        print('Get User Details API failed: No data received');
        return;
      }
      print('Get User Details API response status: ${data.statusCode}');
      print('Get User Details API response body: ${data.body}');
      final getUserResponse =
          GetUserDetailModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (getUserResponse.status == 200) {
          getUserDetailModel = getUserResponse;
          sharedPrefs?.setString(AppStrings.userImage,
              getUserResponse.data?.user?.profilePhoto ?? "");
          sharedPrefs?.setString(
              AppStrings.userName, getUserResponse.data?.user?.fullName ?? "");
          sharedPrefs?.setString(AppStrings.userMobile,
              getUserResponse.data?.user?.mobileNumber ?? "");
          sharedPrefs?.setString(
              AppStrings.userEmail, getUserResponse.data?.user?.email ?? "");
          notifyListeners();
        } else {
          showSnackBar(
            context: context,
            message: getUserResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callGetUserDetailsApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // Change Password API
  Future<void> callChangePasswordApi({
    required BuildContext context,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final data = await RemoteService().callPostApi(
          url: qChangePassword,
          jsonData: {"oldPassword": oldPassword, "newPassword": newPassword});
      if (data == null) {
        print('Change Password API failed: No data received');
        return;
      }
      print('Change Password API response status: ${data.statusCode}');
      print('Change Password API response body: ${data.body}');
      final Map<String, dynamic> response = jsonDecode(data.body);
      final dynamic status = response['status'];
      final String message = response['message'];
      if (context.mounted) {
        if (status == 200) {
          notifyListeners();
          Navigator.of(context).pop();
          showSnackBar(
            context: context,
            message: message,
            isSuccess: true,
          );
        } else {
          showSnackBar(
            context: context,
            message: message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in callChangePasswordApi: $e');
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }

  // SignUp API with category support
  Future<void> signUpApi({
    required BuildContext context,
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String bio,
    File? profilePhoto,
    bool? type,
    required List<String> categoryIds,
  }) async {
    try {
      type = type ?? true;
      
      // Use the selectedImage from state if profilePhoto is not provided
      File? imageToUpload = profilePhoto ?? selectedImage;
      
      // Validate bio length (minimum 3 characters)
      final String bioToUse = bio.trim();
      if (bioToUse.length < 3) {
        showSnackBar(
          context: context,
          message: 'Bio must be at least 3 characters long.',
          isSuccess: false,
        );
        return;
      }

      if (_selectedImage != null) {
        print('profilePhoto: ${_selectedImage?.path}');
      } else {
        print('No image selected.');
      }
print('Starting signUpApi with params:');
      print('email: $email');
      print('fullName: $fullName');
      print('bio: $bioToUse'); // Print the non-empty bio
      print('mobileNumber: $mobileNumber');
      print('categoryIds: $categoryIds');
      print('type: $type');
      print('profilePhoto: ${imageToUpload?.path}');
      print('FCM Token: ${sharedPrefs?.getString(AppStrings.fcmToken) ?? "Fcm Token"}');
      
      Map<String, String> requestBody = {
        "fullName": fullName,
        "password": password,
        "email": email,
        "mobileNumber": mobileNumber,
        "fcmToken": (sharedPrefs?.getString(AppStrings.fcmToken) ?? "Fcm Token"),
        "isProvider": (type?.toString() ?? "true"),
        "bio": bio, // Use the bio exactly as provided
        if (categoryIds.isNotEmpty) "category": categoryIds.first,
      };

      final data = await RemoteService().callMultipartApi(
        url: qRegister,
        requestBody: requestBody,
        file: imageToUpload,
        fileParamName: 'profilePhoto',
      );
      
      if (data == null) {
        showSnackBar(
          context: context,
          message: 'Failed to upload profile photo. Please try again.',
          isSuccess: false,
        );
        return;
      }
      
      if (data.statusCode != 201 && data.statusCode != 200) {
        throw Exception('Server error: ${data.statusCode}');
      }
      print('SignUp API response status: ${data.statusCode}');
      print('SignUp API response body: ${data.body}');
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));

      if (context.mounted) {
        if (commonAuthResponse.status == 201) {
          commonAuthModel = commonAuthResponse;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                roleType: "provider",
                whereComeTo: "signup",
                email: email,
              ),
            ),
          );
          print('SignUp successful: ${commonAuthResponse.message}');
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: true,
          );
        } else if (commonAuthResponse.status == 400) {
          showSnackBar(
            context: context,
            message: commonAuthResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      print('Error in signUpApi: $e');
      if (e is DioException) {
        print('Error details: ${e.response?.statusCode} - ${e.response?.data}');
      }
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'Error occurred while communicating with the server: ${e is DioException ? e.response?.statusCode ?? 'Unknown' : 'Unknown'}',
          isSuccess: false,
        );
      }
    }
    notifyListeners();
  }
}