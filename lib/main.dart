import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'base/observer/app_bloc_observer.dart';

/// due to certificate issue
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  /// approve all https certificate
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox('appBox');
  await dotenv.load(fileName: AssetsRes.DOTENV);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
