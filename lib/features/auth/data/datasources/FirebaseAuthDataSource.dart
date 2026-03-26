import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';

// Actual response from firebase
class FirebaseAuthDataSource {

  Future<UserModel> loginUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      print('In FirebaseAuthDataSource');
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      print("Login response - ${response.toString()}");

      if (user == null || user.email == null) {
        throw Exception("Invalid user data");
      }

      return UserModel(email: user.email ?? "null");
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Login failed");
    }
  }

  Future<UserModel> signUpUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      print('In FirebaseAuthDataSource');
      final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      print("SignUp response - ${response.toString()}");

      if (user == null || user.email == null) {
        throw Exception("Invalid user data");
      }

      return UserModel(email: user.email ?? "null");
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "SignUp failed");
    }
  }


}
