import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'base/observer/app_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('appBox');
  await dotenv.load(fileName: AssetsRes.DOTENV);
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
