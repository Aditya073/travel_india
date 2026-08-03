/* 
class AuthRepositoryImpl implements AuthRepository
*/

import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoimpl implements AuthRepo {
  //this is an instance of "FirebaseAuthDataSource" class which makes direct calls to firebase
  final FirebaseAuthDataSource dataSource;

  AuthRepoimpl({required this.dataSource});

  @override
  Future<UserModel> loginUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await dataSource.loginUsingEmailAndPassword(
      email,
      password,
    );

    return response;
  }

  @override
  Future<UserModel> signUpUsingEmailAndPassword(
    String email,
    String password,
    String name,
    String phoneNumber,
    String lastLocation,
  ) async {
    final response = await dataSource.signUpUsingEmailAndPassword(
      email,
      password,
      name,
      phoneNumber,
      lastLocation,
    );

    return response;
  }

  @override
  Future<UserModel> signInWithGoogle() {
    return dataSource.signInWithGoogle();
  }

  @override
  Future<UserModel> guestSignInUserCase() {
    // TODO: implement guestSignInUserCase
    return dataSource.guestSignInUserCase();
  }

  @override
  Future<void> forgotPasswordSignIn(String email) {
    // TODO: implement forgotPasswordSignIn
    return dataSource.forgotPasswordSignIn(email);
  }
}
