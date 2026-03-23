import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';

// Actual response from firebase
class FirebaseAuthDataSource  {
  Future<UserModel> loginUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    print("Login response - ${response.toString()}");

    return UserModel(email: user?.email ?? "null");
  }
}
