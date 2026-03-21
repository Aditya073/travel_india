/* class AuthRepositoryImpl implements AuthRepository


1. check with email and password  --> (for login)

2. create a user based on the SignUp details

3. Use guest account

4. Use Google to login 


*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_india/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoimpl implements AuthRepo{
  @override
  Future<User> loginUsingEmailAndPassword(String email, String password) {
    return 
  }
}