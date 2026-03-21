import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';

class Loginusecase {
  final AuthRepo repository;

  Loginusecase({required this.repository});

  Future<User> call(String email, String password) {
    return repository.loginUsingEmailAndPassword(email, password);
  }
}
