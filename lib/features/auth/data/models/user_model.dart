/*
0. Uid
1. Email
2. password
3. UserName
4. Phone.No
5. Last location

*/

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? userName;
  final String? phoneNumber;
  final String? lastLocation;
  final Timestamp? timestamp;

  // bool isGuest;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.userName,
    this.phoneNumber,
    this.lastLocation,
    this.timestamp,
  });

  //It’s a named constructor whose job is to convert Firestore data into a UserModel object safely.
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      userName: data['userName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      lastLocation: data['lastLocation'] ?? '',
      timestamp: data['timestamp'] as Timestamp,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "userName": userName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "lastLocation": lastLocation,
      "timestamp": timestamp,
    };
  }
}
