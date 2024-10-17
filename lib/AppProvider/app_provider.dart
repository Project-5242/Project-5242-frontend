import 'package:flutter_project/AppProvider/ScreenProvider/CreateNodeProvider.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/DetailsProvider.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/MessageProvider.dart';
import 'package:flutter_project/AppProvider/ScreenProvider/NotificationProvider.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'ScreenProvider/ContentProvider.dart';
import 'ScreenProvider/OnboardingProvider.dart';
import 'ScreenProvider/addressProvider.dart';

class AppProvider {
  static final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => AddressProvider()),
    ChangeNotifierProvider(create: (_) => CreateNodeProvider()),
    ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ChangeNotifierProvider(create: (_) => OnboardingProvider()),
    ChangeNotifierProvider(create: (_) => DetailsProvider()),
    ChangeNotifierProvider(create: (_) => ContentProvider()),
    ChangeNotifierProvider(create: (_) => MessageProvider()),
  ];
}
