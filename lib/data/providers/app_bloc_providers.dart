import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/domain/bloc/auth/bloc.dart';
import 'package:flutter_project/domain/repositories/auth.dart';

class AppBlocProviders {
  static List<BlocProvider> providers = [
    BlocProvider(create: (context) => AuthBloc(repository: AuthRepository.instance)),
  ];
}
