/* class AuthRepositoryImpl implements AuthRepository


1. check with email and password  --> (for login)

2. create a user based on the SignUp details

3. Use guest account

4. Use Google to login 

*/

import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:travel_india/features/auth/domain/entities/users.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoimpl implements AuthRepo {
  //this is an instance of "FirebaseAuthDataSource" class which makes direct calls to firebase
  final FirebaseAuthDataSource dataSource;

  AuthRepoimpl({required this.dataSource});

  @override
  Future<Users> loginUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await dataSource.loginUsingEmailAndPassword(
      email,
      password,
    );

    return Users(email: response.email!);
  }

  @override
  Future<Users> signUpUsingEmailAndPassword(
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
      lastLocation
    );

    return Users(email: response.email!);
  }
}
