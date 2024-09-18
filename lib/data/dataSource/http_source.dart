import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_project/base/utils/app_constants.dart';
import 'package:flutter_project/base/utils/app_utils.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../Widgets/Widgets.dart';

import '../models/http/httpResult.dart';

/// API service
class HttpService {
  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();

  /// To access the repo quickly
  static HttpService get instance => _instance;

  /// Client
  final client = http.Client();

  /// no internet connection
  final HttpResult _noInternetConnection = const HttpResult(
    code: 503,
    message: 'No internet connection',
    responseString: "{'message': 'No internet connection'}",
  );

  /// on token error
  void _onTokenError() {
    AppUtils.showToast(
        message: 'Session expired, please login again', error: true);
  }

  /// Checks internet connectivity
  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  /// Makes a GET request to the specified path and returns the response.
  Future<HttpResult> getRequest(String path,
      {Map<String, String>? headers}) async {
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    final response = await client.get(Uri.tryParse(path)!, headers: headers);
    if (response.statusCode == 401 || response.statusCode == 403) {
      _onTokenError();
    }
    return _handleResponse(response);
  }

  /// Makes a POST request to the specified path and returns the response.
  Future<HttpResult> postRequest(String path,
      {var body, Map<String, String>? headers}) async {
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    final response =
        await client.post(Uri.tryParse(path)!, body: body, headers: headers);
    return _handleResponse(response);
  }

  /// Makes a PUT request to the specified path and returns the response.
  Future<HttpResult> putRequest(String path,
      {var body, Map<String, String>? headers}) async {
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    final response =
        await client.put(Uri.tryParse(path)!, body: body, headers: headers);
    if (response.statusCode == 401 || response.statusCode == 403) {
      _onTokenError();
    }
    return _handleResponse(response);
  }

  /// Makes a DELETE request to the specified path and returns the response.
  Future<HttpResult> deleteRequest(
    String path, {
    Map<String, String>? headers,
  }) async {
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    final response = await client.delete(Uri.tryParse(path)!, headers: headers);
    if (response.statusCode == 401 || response.statusCode == 403) {
      _onTokenError();
    }
    return _handleResponse(response);
  }

  /// Uploads a file to the specified path with optional headers and additional fields.
  Future<HttpResult> uploadFile(String path, File file,
      {Map<String, String>? headers,
      Map<String, String>? fields,
      String? photoField}) async {
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    try {
      var request = http.MultipartRequest('POST', Uri.tryParse(path)!);

      // Attach file
      request.files.add(await http.MultipartFile.fromPath(
        photoField ??
            'files', // This is the name of the field that the server expects
        file.path,
        filename: basename(file.path),
      ));

      // Add any fields if needed
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // Add headers if available
      if (headers != null) {
        request.headers.addAll(headers);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      return HttpResult(
        code: 500,
        message: 'File upload failed: $e',
      );
    }
  }

  /// upload multiple files
  Future<HttpResult> uploadMultipleFiles(String path, List<File> files,
      {Map<String, String>? headers,
      Map<String, String>? fields,
      String? photoField}) async {
    print('working multiple');
    if (!await _isConnected()) {
      return _noInternetConnection;
    }

    try {
      final request = http.MultipartRequest('POST', Uri.tryParse(path)!);

      // Attach files
      for (final file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          photoField ??
              'files', // This is the name of the field that the server expects
          file.path,
          filename: basename(file.path),
        ));
      }

      // Add any fields if needed
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // Add headers if available
      if (headers != null) {
        request.headers.addAll(headers);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      return HttpResult(
        code: 500,
        message: 'File upload failed: $e',
      );
    }
  }

  /// Handles the response and maps status codes to appropriate messages.
  HttpResult _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return _getResult(response);
      case 400:
        return HttpResult(
          code: 400,
          message: 'Bad Request',
          responseString: response.body,
        );
      case 401:
        return HttpResult(
          code: 401,
          message: 'Unauthorized',
          responseString: response.body,
        );
      case 403:
        return HttpResult(
          code: 403,
          message: 'Forbidden',
          responseString: response.body,
        );
      case 404:
        return HttpResult(
          code: 404,
          message: 'Not Found',
          responseString: response.body,
        );
      case 500:
        return HttpResult(
          code: 500,
          message: 'Internal Server Error',
          responseString: response.body,
        );
      default:
        return HttpResult(
          code: response.statusCode,
          message: response.reasonPhrase ?? 'Unknown error',
          responseString: response.body,
        );
    }
  }

  /// Creates an instance of `HttpResult` by extracting the status code, reason phrase, and response body from the given `http.Response` object.
  static HttpResult _getResult(http.Response response) {
    return HttpResult.create(
      code: response.statusCode,
      message: response.reasonPhrase,
      responseString: response.body,
    );
  }
}
