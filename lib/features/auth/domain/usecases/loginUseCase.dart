import 'package:firebase_auth/firebase_auth.dart';
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
