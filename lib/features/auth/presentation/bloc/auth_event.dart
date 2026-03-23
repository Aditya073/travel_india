part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// An event for login using Email and Password
class AuthLoginUsingEmailandPassword extends AuthEvent {
  final String email;
  final String password;

  AuthLoginUsingEmailandPassword({required this.email, required this.password});
}
