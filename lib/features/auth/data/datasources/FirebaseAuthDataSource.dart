import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';

// Actual response from firebase
class FirebaseAuthDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Login with Email and Password function
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

  // SignUP with Email and Password function
  Future<UserModel> signUpUsingEmailAndPassword(
    String email,
    String password,
    String name,
    String phoneNumber,
    String lastLocation,
  ) async {
    try {
      print('In FirebaseAuthDataSource');
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = response.user;
      print("SignUp response - ${response.toString()}");

      if (user == null || user.email == null) {
        throw Exception("Invalid user data");
      }

          await user.updateDisplayName(name);


      print(user.toString());
      final userModel = UserModel(
      uid: user.uid,
      userName: name,
      email: user.email!,
      phoneNumber: phoneNumber,
      lastLocation: lastLocation,
      );

      // ALWAYS create Firestore document
      await firestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap(), SetOptions(merge: true));

      return userModel;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "SignUp failed");
    }
  }
}
