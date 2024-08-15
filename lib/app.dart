import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/routes/route_generator.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:flutter_project/themes/dark_theme.dart';
import 'package:flutter_project/themes/light_theme.dart';
import 'package:toastification/toastification.dart';

import 'base/observer/route_observer.dart';
import 'data/providers/app_bloc_providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("${dotenv.env['GOOGLE_API_KEY']}");
    return ToastificationWrapper(
      child: MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            navigatorKey: Routes.navigatorKey,
            theme: getLightTheme(context),
            darkTheme: getDarkTheme(context),
            themeMode: ThemeMode.light,
            initialRoute: Routes.profileView,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: [AppRouteObserver()],
          ),
        ),
      ),
    );
  }
}
