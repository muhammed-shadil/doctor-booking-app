part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  User? user;
  Authenticated(
    this.user,
  );

  @override
  List<Object?> get props => [user];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedError extends AuthState {
  final String message;

  AuthenticatedError({required this.message});

  @override
  List<Object?> get props => [];
}
