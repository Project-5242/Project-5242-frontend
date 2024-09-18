part of 'bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}
/// login
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

/// register
class RegisterEvent extends AuthEvent {
  final UserModel user;
  const RegisterEvent(this.user);

  @override
  List<Object> get props => [user];
}

/// verify email
class VerifyEmailEvent extends AuthEvent {
  final String email;
  final String otp;
  const VerifyEmailEvent(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}

/// resend otp
class ResendOtpEvent extends AuthEvent {
  final String email;
  const ResendOtpEvent(this.email);

  @override
  List<Object> get props => [email];
}

/// forgot password
class ForgotPasswordSendOtpEvent extends AuthEvent {
  final String email;
  const ForgotPasswordSendOtpEvent(this.email); 

  @override
  List<Object> get props => [email];
}

/// change password
class ChangePasswordEvent extends AuthEvent {
  final String email;
  final String password;
  const ChangePasswordEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
/// update profile
class UpdateProfileEvent extends AuthEvent {
  final UserModel user;
  const UpdateProfileEvent(this.user);

  @override
  List<Object> get props => [user];
}