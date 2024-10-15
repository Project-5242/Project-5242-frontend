import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/helpers/helper.dart';
import 'package:flutter_project/data/constants/app_string.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/presentation/auth/login_view.dart';
import 'package:http/http.dart' as http;

import '../../routes/routes.dart';
import 'api_config.dart';
import 'app_exceptions.dart';

class RemoteService {
  Future<String?> getAuthToken() async {
    String? token = sharedPrefs?.getString(AppStrings.token);
    if (token == '') {
      return null;
    } else {
      return token;
    }
  }

  Future<String?> getOsType() async {
    String? os = sharedPrefs?.getString(AppStrings.deviceOs);
    if (os == '') {
      return null;
    } else {
      return os;
    }
  }

  Future<http.Response?> callGetApi({
    required String url,
  }) async {
    http.Response? responseJson;
    try {
      showLoaderDialog(Routes.navigatorKey.currentContext!);

      var authToken = await getAuthToken();
      var osType = await getOsType();
      var header = <String, String>{
        'Content-Type': 'application/json',
        'device_type': osType ?? 'mobile',
        'Authorization': authToken ?? "",
      };

      // Log the HTTP method and other details
      log('HTTP Method: GET');
      log('API URL: $BASE_URL$url');
      log('Headers: $header');

      final response =
          await http.get(Uri.parse('$BASE_URL$url'), headers: header);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body: ${response.body.toString()}');

      if (response.statusCode == 401) {
        sharedPrefs?.clear();
        Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false);
      }
      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: exception.message.toString());
      throw NoInternetException('No Internet');
    } catch (e) {
      _handleException(e);
    }

    return responseJson;
  }

  Future<http.Response?> callPostApi({
    required String url,
    required Map<String, dynamic> jsonData,
    Map<String, dynamic>? jsonDataForStripe,
    bool isForStripe = false,
    String? urlForStripe,
  }) async {
    http.Response? responseJson;
    var headers;
    try {
      showLoaderDialog(Routes.navigatorKey.currentContext!);
      var authToken = await getAuthToken();
      var osType = await getOsType();
      headers = <String, String>{
        'Content-Type': 'application/json',
        'device_type': osType ?? 'mobile',
        'Authorization': authToken ?? "",
      };

      String apiUrl = isForStripe ? '$urlForStripe' : '$BASE_URL$url';
      dynamic requestBody =
          isForStripe ? jsonDataForStripe : jsonEncode(jsonData);

      // Log the HTTP method and other details
      log('HTTP Method: POST');
      log('API URL: $apiUrl');
      log('Headers: $headers');
      log('Request Body: $requestBody');

      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body: ${response.body.toString()}');

      if (response.statusCode == 401) {
        sharedPrefs?.clear();
        Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false);
      }
      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: exception.message.toString());
    } catch (e) {
      _handleException(e);
    }
    return responseJson;
  }

  Future<http.Response?> callPutApi({
    required String url,
    required Map<String, dynamic> jsonData,
    Map<String, dynamic>? jsonDataForStripe,
    bool isForStripe = false,
    String? urlForStripe,
  }) async {
    http.Response? responseJson;
    var headers;
    try {
      showLoaderDialog(Routes.navigatorKey.currentContext!);
      var authToken = await getAuthToken();
      var osType = await getOsType();
      headers = <String, String>{
        'Content-Type': 'application/json',
        'device_type': osType ?? 'mobile',
        'Authorization': authToken ?? "",
      };

      String apiUrl = isForStripe ? '$urlForStripe' : '$BASE_URL$url';
      dynamic requestBody =
          isForStripe ? jsonDataForStripe : jsonEncode(jsonData);

      // Log the HTTP method and other details
      log('HTTP Method: PUT');
      log('API URL: $apiUrl');
      log('Headers: $headers');
      log('Request Body: $requestBody');

      final response = await http.put(Uri.parse(apiUrl),
          headers: headers, body: requestBody);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body: ${response.body.toString()}');

      if (response.statusCode == 401) {
        sharedPrefs?.clear();
        Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false);
      }
      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: exception.message.toString());
    } catch (e) {
      _handleException(e);
    }
    return responseJson;
  }

  Future<http.Response?> callDeleteApi({
    required String url,
  }) async {
    http.Response? responseJson;
    try {
      showLoaderDialog(Routes.navigatorKey.currentContext!);
      var authToken = await getAuthToken();
      var osType = await getOsType();
      var header = <String, String>{
        'Content-Type': 'application/json',
        'device_type': osType ?? 'mobile',
        'Authorization': authToken ?? "",
      };

      // Log the HTTP method and other details
      log('HTTP Method: DELETE');
      log('API URL: $BASE_URL$url');
      log('Headers: $header');

      final response =
          await http.delete(Uri.parse('$BASE_URL$url'), headers: header);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body: ${response.body.toString()}');

      if (response.statusCode == 401) {
        sharedPrefs?.clear();
        Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false);
      }
      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: exception.message.toString());
    } catch (e) {
      _handleException(e);
    }
    return responseJson;
  }

  Future<http.Response?> callMultipartApi({
    required String url,
    required Map<String, String> requestBody,
    File? file,
    List<File>? selectedFile,
    String? fileParamName,
    String? requestName,
  }) async {
    showLoaderDialog(Routes.navigatorKey.currentContext!);

    http.Response? responseJson;
    var authToken = await getAuthToken();
    var osType = await getOsType();
    var request =
        http.MultipartRequest(requestName ?? 'POST', Uri.parse(BASE_URL + url));
    request.headers.addAll(<String, String>{
      'Content-Type': 'multipart/form-data',
      'device_type': osType ?? 'mobile',
      'Authorization': authToken ?? "",
    });

    // Log the HTTP method and other details
    log('HTTP Method: ${request.method}');
    log('API URL: ${request.url}');
    log('Headers: ${request.headers}');

    if (fileParamName != null && file != null) {
      request.files.add(http.MultipartFile(
          fileParamName, file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path.split("/").last));
    }

    if (fileParamName != null && selectedFile != null) {
      for (var a in selectedFile) {
        request.files.add(http.MultipartFile(
            fileParamName, a.readAsBytes().asStream(), a.lengthSync(),
            filename: a.path.split("/").last));
      }
    }
    request.fields.addAll(requestBody);

    log('Request Body Fields: $requestBody');

    try {
      final response = await http.Response.fromStream(await request.send());
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body: ${response.body.toString()}');

      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: exception.message.toString());
    } catch (e) {
      _handleException(e);
    }
    return responseJson;
  }

  // Helper method to handle exceptions
  void _handleException(dynamic e) {
    log('Exception: $e');

    try {
      final exceptionData = jsonDecode(e.toString());
      if (exceptionData["message"] == "Invalid auth token") {
        showSnackBar(
            context: Routes.navigatorKey.currentContext,
            isSuccess: false,
            message: "Logged out!");
        sharedPrefs?.clear();
        Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false);
      }
    } catch (jsonError) {
      log('JSON Decode Error: $jsonError');
      // Handle other types of exceptions if necessary
    }
  }

  dynamic _returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        return response;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        return response;
      case 406:
        return response;
      case 409:
        return response;
      case 500:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
