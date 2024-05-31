part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final Usermodel user;

  SignUpEvent({required this.user});
}

class LogoutEvent extends AuthEvent {}

class UpdateEvent extends AuthEvent {
  final Usermodel user;

  UpdateEvent({required this.user});
}

class LogoutConfirmEvent extends AuthEvent {}
