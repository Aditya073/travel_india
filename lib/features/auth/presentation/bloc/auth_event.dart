part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// An event for login using Email and Password
class AuthLoginUsingEmailandPassword extends AuthEvent {
  final String email;
  final String password;

  AuthLoginUsingEmailandPassword({required this.email, required this.password});
}

// An event for signUp using Email and Password
class AuthSignUpUsingEmailandPassword extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String lastLocation;
  final Timestamp timestamp;

  AuthSignUpUsingEmailandPassword({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.lastLocation, required this.timestamp,
  });
}

class GoogleSignIn extends AuthEvent {}

class GuestSignIn extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  final String email;

  ForgotPassword({required this.email});
}
