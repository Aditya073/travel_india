/* abstract classes

1. check with email and password  --> (for login)

2. create a user based on the SignUp details

3. Use guest account

4. Use Google to login 


*/

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<User> loginUsingEmailAndPassword(String email, String password);
  // Future<User> loginUsingGoogle(String email, String password);
}
