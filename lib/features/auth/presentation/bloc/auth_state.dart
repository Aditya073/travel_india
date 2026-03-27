part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

 class AuthInitial extends AuthState {}

 class AuthLoading extends AuthState {}

 class LoginSuccess extends AuthState {
  final String email;

  LoginSuccess({required this.email});
}
 class SignUpSuccess extends AuthState {
  final String email;

  SignUpSuccess({required this.email});
}
 class LoginFailure extends AuthState{
  final String message;

  LoginFailure({required this.message});
 }
 class SignUpFailure extends AuthState{
  final String message;

  SignUpFailure({required this.message});
 }
