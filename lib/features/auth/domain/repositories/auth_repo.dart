/* abstract classes

1. check with email and password  --> (for login)  - Done

2. create a user based on the SignUp details  - Done

3. Use guest account

4. Use Google to login  - Done


*/

import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:travel_india/features/auth/domain/entities/users.dart';

abstract class AuthRepo {
  Future<Users> loginUsingEmailAndPassword(String email, String password);
  Future<Users> signUpUsingEmailAndPassword(
    String email,
    String password,
    String name,
    String phoneNumber,
    String lastLocation,
  );
  Future<UserModel> signInWithGoogle();
  Future<UserModel> guestSignInUserCase();
  Future<void> forgotPasswordSignIn(String email);
}
