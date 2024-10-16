import 'dart:convert';
import 'dart:io';

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
import 'package:image_picker/image_picker.dart';

import '../../../routes/routes.dart';

class SignUpProvider extends ChangeNotifier {
  // Todo Sign Up Api
  String? _otpValue;

  String? get otpValue => _otpValue;

  set otpValue(String? value) {
    _otpValue = value;
    notifyListeners();
  }

  CommonAuthModel commonAuthModel = CommonAuthModel();

  // Todo Sign Up Api

  Future<void> signUpApi({
    required BuildContext context,
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    bool? type,
  }) async {
    List<String> selectedCategories = categoriesList
        .where((category) => category.isSelected == true)
        .map((category) => category.id!)
        .toList();
    try {
      final data = await RemoteService().callPostApi(url: qRegister, jsonData: {
        "fullName": fullName,
        "password": password,
        "email": email,
        "mobileNumber": mobileNumber,
        "fcmToken": sharedPrefs?.get(AppStrings.fcmToken) ?? "Fcm Token",
        "isProvider": true,
        "category": selectedCategories,
      });
      if (data == null) {
        return;
      }
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

  // Todo Category Api
  final ScrollController scrollController = ScrollController();
  init() {
    allCategoryApi(context: Routes.navigatorKey.currentContext!);
  }

  CategoriesResponseModel categoriesResponseModel = CategoriesResponseModel();
  List<CategoriesList> categoriesList = [];
  int currentPage = 1;
  int totalPages = 1;
  int? selectedCategoryIndex;

  Future<void> allCategoryApi({required BuildContext context}) async {
    try {
      final data = await RemoteService()
          .callGetApi(url: "$qAllCategory?page=$currentPage");
      if (data == null) {
        return;
      }
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
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: 'An error occurred: $e',
          isSuccess: false,
        );
      }
    }
  }

  // Todo Otp Verify Api

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
        return;
      }
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
          if (roleType == "provider" || isProvider) {
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

  File? selectedImage;
  String? profileImageUpdate;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      profileImageUpdate = pickedFile.path;
      callUpdateProfileApi(context: Routes.navigatorKey.currentContext!);
      notifyListeners();
    }
  }

  final int totalSteps = 3;

  Future<void> callSignUpUserApi({
    required BuildContext context,
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
  }) async {
    try {
      final data = await RemoteService().callPostApi(url: qRegister, jsonData: {
        "fullName": fullName,
        "password": password,
        "email": email,
        "mobileNumber": mobileNumber,
        "fcmToken": sharedPrefs?.get(AppStrings.fcmToken) ?? "Fcm Token",
        "isProvider": false,
      });
      if (data == null) {
        return;
      }
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

  // Todo Resend Otp Api

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
        return;
      }
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == "success") {
          commonAuthModel = commonAuthResponse;
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
          sharedPrefs?.setString(AppStrings.userMobile,
              commonAuthResponse.data?.mobileNumber ?? "");
          sharedPrefs?.setBool(AppStrings.isLogin, true);
          sharedPrefs?.setBool(AppStrings.isProvider,
              commonAuthResponse.data?.isProvider ?? false);

          final isProvider = commonAuthResponse.data?.isProvider ?? false;

          // Navigate based on role type or isProvider flag
          if (roleType == "provider" || isProvider) {
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
                builder: (context) => const BottomNavBarProvider(),
              ),
              (route) => false,
            );
          }

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
        return;
      }
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

  // Todo Forgot OTP Verify APi

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
        return;
      }
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
        return;
      }
      final commonAuthResponse =
          CommonAuthModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        if (commonAuthResponse.status == 200) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) => false,
          );
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

  // Todo Logout
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

  // Todo Get User Details

  GetUserDetailModel getUserDetailModel = GetUserDetailModel();

  Future<void> callGetUserDetailsApi({
    required BuildContext context,
  }) async {
    try {
      final data = await RemoteService().callGetApi(url: qGetUserDetail);
      if (data == null) {
        return;
      }
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

  Future<void> callUpdateProfileApi({required BuildContext context}) async {
    final data = await RemoteService().callMultipartApi(
      url: qUpdateProfilePic,
      fileParamName: "profileImage",
      file: selectedImage,
      requestBody: {},
    );
    if (data == null) {
      return;
    }
    final response = GetUserDetailModel.fromJson(jsonDecode(data.body));
    if (context.mounted) {
      if (response.status == 200) {
        showSnackBar(
            context: Routes.navigatorKey.currentContext,
            isSuccess: true,
            message: response.message);
      } else {
        showSnackBar(
            context: Routes.navigatorKey.currentContext,
            isSuccess: false,
            message: response.message);
      }
    }
    notifyListeners();
  }

  // Todo Change Password Api

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
        return;
      }
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

  // Todo Update Profile

  Future<void> callUpdateProfileDetailApi({
    required BuildContext context,
    required String phone,
    required String fullName,
  }) async {
    try {
      final data = await RemoteService().callPutApi(
        url: qUpdateProfile,
        jsonData: {
          "mobileNumber": phone,
          "fullName": fullName,
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
        if (commonAuthResponse.status == 200) {
          commonAuthModel = commonAuthResponse;
          sharedPrefs?.setString(
              AppStrings.userName, commonAuthResponse.data?.fullName ?? "");
          sharedPrefs?.setString(
              AppStrings.userEmail, commonAuthResponse.data?.email ?? "");
          sharedPrefs?.setString(AppStrings.userMobile,
              commonAuthResponse.data?.mobileNumber ?? "");

          Navigator.of(context).pop();

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
}
