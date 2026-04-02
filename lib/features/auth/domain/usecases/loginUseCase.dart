import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:travel_india/features/auth/domain/entities/users.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo repository;

  LoginUsecase(this.repository);

  Future<Users> call(String email, String password) {
    print('in LoginUsercase');
    return repository.loginUsingEmailAndPassword(email, password);
  }
}

class SignUpUsercase {
  final AuthRepo repository;

  SignUpUsercase(this.repository);

  Future<Users> call(
    String email,
    String password,
    String name,
    String phoneNumber,
    String lastLocation,
  ) {
    print('in SignUpUsercase');
    return repository.signUpUsingEmailAndPassword(
      email,
      password,
      name,
      phoneNumber,
      lastLocation,
    );
  }
}

class GoogleSignInUseCase {
  final AuthRepo repository;

  GoogleSignInUseCase(this.repository);

  Future<UserModel> call() {
    return repository.signInWithGoogle();
  }
}

class GuestSignInUserCase {
  final AuthRepo repository;

  GuestSignInUserCase(this.repository);

  Future<UserModel> call() {
    return repository.guestSignInUserCase();
  }
}

class ForgotPasswordSignIn {
  final AuthRepo repository;

  ForgotPasswordSignIn({required this.repository});

  Future<UserModel> call(String email) {
    return repository.forgotPasswordSignIn(email);
  }
}
