import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/res/assets_res.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppProvider/app_provider.dart';
import 'app.dart';
import 'firebase_options.dart';

SharedPreferences? sharedPrefs;
String deviceToken = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: AssetsRes.DOTENV);
  sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: AppProvider.appProviders,
      child: const MyApp(),
    ),
  );
}
