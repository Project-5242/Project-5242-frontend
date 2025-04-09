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
    return token == '' ? null : token;
  }

  Future<String?> getOsType() async {
    String? os = sharedPrefs?.getString(AppStrings.deviceOs);
    return os == '' ? null : os;
  }

  String prettyJson(String json) {
    var encoder = const JsonEncoder.withIndent('  ');
    var decoded = jsonDecode(json);
    return encoder.convert(decoded);
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
      String prettyResponse = prettyJson(response.body);
      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body (Normal JSON): ${response.body}');
      log('API Response Body (Pretty JSON): $prettyResponse');

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
      return null;
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
      log('Request Body (Normal JSON): $requestBody');
      log('Request Body (Pretty JSON): ${prettyJson(requestBody)}');

      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body (Normal JSON): ${response.body}');
      log('API Response Body (Pretty JSON): ${prettyJson(response.body)}');

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
      return null;
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
      log('Request Body (Normal JSON): $requestBody');
      log('Request Body (Pretty JSON): ${prettyJson(requestBody)}');

      final response = await http.put(Uri.parse(apiUrl),
          headers: headers, body: requestBody);
      hideLoader(Routes.navigatorKey.currentContext!);

      log('API Response Status Code: ${response.statusCode}');
      log('API Response Body (Normal JSON): ${response.body}');
      log('API Response Body (Pretty JSON): ${prettyJson(response.body)}');

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
      return null;
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
      log('API Response Body (Normal JSON): ${response.body}');
      log('API Response Body (Pretty JSON): ${prettyJson(response.body)}');

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
      return null;
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
    var headers = await _setHeaders();

    // Log the HTTP method and other details
    log('HTTP Method: MULTIPART');
    log('API URL: $BASE_URL$url');
    log('Headers: $headers');
    log('Request Body (Normal JSON): $requestBody');
    log('Request Body (Pretty JSON): ${prettyJson(jsonEncode(requestBody))}');

    var request = http.MultipartRequest('POST', Uri.parse('$BASE_URL$url'));
    request.headers.addAll(headers);
    request.fields.addAll(requestBody);
    if (file != null) {
      var stream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile(fileParamName!, stream, length,
          filename: file.path.split('/').last);
      request.files.add(multipartFile);
    }
    if (selectedFile != null) {
      for (var selected in selectedFile) {
        var stream = http.ByteStream(selected.openRead());
        var length = await selected.length();
        var multipartFile = http.MultipartFile(fileParamName!, stream, length,
            filename: selected.path.split('/').last);
        request.files.add(multipartFile);
      }
    }

    var response = await request.send();
    hideLoader(Routes.navigatorKey.currentContext!);
    var responseBody = await http.Response.fromStream(response);

    log('API Response Status Code: ${responseBody.statusCode}');
    log('API Response Body (Normal JSON): ${responseBody.body}');
    log('API Response Body (Pretty JSON): ${prettyJson(responseBody.body)}');

    if (responseBody.statusCode == 401) {
      sharedPrefs?.clear();
      Navigator.of(Routes.navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginView()),
          (Route<dynamic> route) => false);
    }
    return _returnResponse(responseBody);
  }

  // Utility method for setting headers
  Future<Map<String, String>> _setHeaders() async {
    var authToken = await getAuthToken();
    var osType = await getOsType();
    return {
      'Content-Type': 'application/json',
      'device_type': osType ?? 'mobile',
      'Authorization': authToken ?? '',
    };
  }

  // Error handling
  void _handleException(e) {
    if (e is NoInternetException) {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: e.toString());
    } else {
      showSnackBar(
          context: Routes.navigatorKey.currentContext,
          isSuccess: false,
          message: 'Something went wrong. Please try again later.');
    }
  }

  // Response handling
  _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
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
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server: ${response.statusCode}');
    }
  }
}
