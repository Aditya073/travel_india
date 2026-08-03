part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

 class AuthInitial extends AuthState {}

 class AuthLoading extends AuthState {}

 class LoginSuccess extends AuthState {
  final UserModel userModel;

  LoginSuccess({required this.userModel});
}
 class SignUpSuccess extends AuthState {
  final UserModel userModel;

  SignUpSuccess({required this.userModel});
}
 class GoogleSignInSuccess extends AuthState {
  final UserModel userModel;

  GoogleSignInSuccess({required this.userModel});
}
 class GuestSignInSuccess extends AuthState {
  final UserModel userModel;

  GuestSignInSuccess({required this.userModel});
}
 class ForgotPasswordSignInSuccess extends AuthState {
  // final UserModel userModel;

  ForgotPasswordSignInSuccess();
}




 class LoginFailure extends AuthState{
  final String message;

  LoginFailure({required this.message});
 }
 class SignUpFailure extends AuthState{
  final String message;

  SignUpFailure({required this.message});
 }
 
 class GoogleSignInFailure extends AuthState{
  final String message;

  GoogleSignInFailure({required this.message});
 }
 class GuestSignInFailure extends AuthState{
  final String message;

  GuestSignInFailure({required this.message});
 }
 class ForgotPasswordSignInFailure extends AuthState{
  final String message;

  ForgotPasswordSignInFailure({required this.message});
 }
