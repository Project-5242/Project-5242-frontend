import 'package:flutter_project/AppProvider/ScreenProvider/DetailsProvider.dart';
import 'package:flutter_project/presentation/auth/AuthProvider/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'ScreenProvider/OnboardingProvider.dart';

class AppProvider {
  static final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
    ChangeNotifierProvider(create: (_) => OnboardingProvider()),
    ChangeNotifierProvider(create: (_) => DetailsProvider()),
  ];
}
