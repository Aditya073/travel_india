import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';

// Actual response from firebase
class FirebaseAuthDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Login with Email and Password function
  Future<UserModel> loginUsingEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      print('In FirebaseAuthDataSource');
      final response = await firebaseAuth.signInWithEmailAndPassword(
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

      print("User document fetched: ${doc.id}");
      return UserModel.fromFirestore(doc);
    } catch (e) {
      print("Firestore error: $e");
      rethrow;
    }
  }

  Future<UserModel> guestSignInUserCase() async {
    try {
      final response = await firebaseAuth.signInAnonymously();

      if (response.user == null) {
        throw 'User is null';
      }

      final user = response.user;
      
      //  CHECK IF USER EXISTS IN FIRESTORE
      final doc = await firestore
          .collection("users")
          .doc(response.user!.uid)
          .get();

      final UserModel newUserModel;

      if (!doc.exists) {
        // create new user
        Random random = Random();
        int randomNum = 10000 + random.nextInt(90000);

        newUserModel = UserModel(
          uid: user!.uid,
          email: user.email ?? "",
          password: "",
          lastLocation: "",
          userName: user.displayName ?? "Guest$randomNum",
          phoneNumber: user.phoneNumber ?? "",
        );

        // add the data in firestore
        await firestore
            .collection('users')
            .doc(user.uid)
            .set(newUserModel.toMap());
        return newUserModel;
      }
      
      // User already exists, fetch from Firestore
      return await getUserData(user!.uid);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw Exception("Google Sign-In cancelled");
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        throw Exception("Google Sign-In failed");
      }

      //  CHECK IF USER EXISTS IN FIRESTORE
      final doc = await firestore.collection("users").doc(user.uid).get();

      final UserModel userModel;

      if (!doc.exists) {
        // NEW USER → CREATE DOCUMENT
        userModel = UserModel(
          uid: user.uid,
          userName: user.displayName ?? "",
          email: user.email!,
          phoneNumber: user.phoneNumber ?? "",
          lastLocation: "",
        );

        await firestore
            .collection("users")
            .doc(user.uid)
            .set(userModel.toMap());
      } else {
        // EXISTING USER → FETCH DATA

        // error here................................................
        userModel = await getUserData(user.uid);
      }

      return userModel;
    } catch (e) {
      throw Exception("Google Sign-In failed: $e");
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
