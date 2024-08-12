import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/domain/bloc/auth/auth_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider(create: (context) => AuthBloc()),
  ];
}
