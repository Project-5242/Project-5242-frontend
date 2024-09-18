import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project/base/utils/navigatorService.dart';
import 'package:flutter_project/data/models/user.dart';
import 'package:flutter_project/domain/repositories/auth.dart';

import '../../../routes/routes.dart';

part 'event.dart';
part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthInitState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<VerifyEmailEvent>(_verifyEmail);
    on<ResendOtpEvent>(_resendOtp);
    on<ForgotPasswordSendOtpEvent>(_forgotPasswordSendOtp);
    on<ChangePasswordEvent>(_changePassword);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result =
        await repository.login(email: event.email, password: event.password);
    if (result) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await repository.register(user: event.user);
    if (result) {
      emit(AuthSuccessState());
      Navigatorservice.pushNamed(Routes.createProfile);
    } else {
      emit(AuthErrorState());
    }
  }

  Future<void> _verifyEmail(
      VerifyEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result =
        await repository.verifyEmail(email: event.email, otp: event.otp);
    if (result) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  Future<void> _resendOtp(ResendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await repository.resendOtp(email: event.email);
    if (result) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  Future<void> _forgotPasswordSendOtp(
      ForgotPasswordSendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await repository.forgotPasswordSendOtp(email: event.email);
    if (result) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }

  Future<void> _changePassword(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await repository.changePassword(
        email: event.email, password: event.password);
    if (result) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }
}
