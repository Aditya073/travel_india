import 'dart:developer';

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

      final userData = await getUserData(response.user!.uid);
      return userData;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Login failed");
    }
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      final doc = await firestore.collection("users").doc(uid).get();

      if (!doc.exists) {
        throw Exception("User data not found in Firestore");
      }

      log("User document fetched: ${doc.id}");
      return UserModel.fromFirestore(doc);
    } catch (e) {
      log("Firestore error: $e");
      rethrow;
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

      final formattedPhone = phoneNumber.replaceAll(RegExp(r'\s+'), '');

      // checks
      if (await checkEmailExists(email)) {
        throw Exception("Email already exists");
      }

      if (await checkingPhonenumberExists(formattedPhone)) {
        throw Exception("Phone number already exists");
      }

      if (await checkingUsernameExists(name)) {
        throw Exception("Username already exists");
      }

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

  Future<bool> checkEmailExists(String email) async {
    try {
      final query = await firestore
          .collection("users")
          .where("email", isEqualTo: email.trim())
          .get();

      return query.docs.isNotEmpty; // true
    } catch (e) {
      print("Error checking email: $e");
      return false;
    }
  }

  Future<bool> checkingPhonenumberExists(String phoneNumber) async {
    try {
      final formatePhoneNumber = phoneNumber.replaceAll(
        RegExp(r'\s+'),
        "".trim(),
      );
      final quarySnapShort = await firestore
          .collection("users")
          .where("phoneNumber", isEqualTo: formatePhoneNumber)
          .get();
      return quarySnapShort.docs.isNotEmpty; // true
    } catch (e) {
      print('Error while checking email : $e');
      return false;
    }
  }

  Future<bool> checkingUsernameExists(String userName) async {
    try {
      final formateUsername = userName.trim();

      final quarySnapShort = await firestore
          .collection("users")
          .where("userName", isEqualTo: formateUsername)
          .get();
      return quarySnapShort.docs.isNotEmpty; // true
    } catch (e) {
      print('Error while checking UserName : $e');
      return false;
    }
  }
}
