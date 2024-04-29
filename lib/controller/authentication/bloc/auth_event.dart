part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable{}
 
 class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
  
  @override
  
  List<Object?> get props => [email,password];
 }
 class SignUpEvent extends AuthEvent{
  final Usermodel user;

  SignUpEvent({required this.user});
  
  @override
 
  List<Object?> get props =>[user];

 }
 class LogoutEvent extends AuthEvent{
  @override

  List<Object?> get props => [];

 }