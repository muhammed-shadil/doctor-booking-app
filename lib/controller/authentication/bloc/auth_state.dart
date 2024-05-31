// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  User? user;
  Authenticated(
    this.user,
  );
}

class UnAuthenticated extends AuthState {}

class AuthenticatedError extends AuthState {
  final String message;

  AuthenticatedError({required this.message});
}

class Networkauthenticatederor extends AuthState {
  final String message;
  Networkauthenticatederor({
    required this.message,
  });
}

class UpdateState extends AuthState {}

class UpdationError extends AuthState {
  final String msg;
  UpdationError({
    required this.msg,
  });
}

class LogoutConfirm extends AuthState {}
