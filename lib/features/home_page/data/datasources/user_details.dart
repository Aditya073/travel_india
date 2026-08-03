import 'package:travel_india/features/auth/data/datasources/FirebaseAuthDataSource.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';

class UserDetails {
  final FirebaseAuthDataSource userDetails;

  UserDetails({required this.userDetails});

  Future<UserModel> getUserData(String uid) {
    // try{

    final user = userDetails.getUserData(uid);
    // }
    // catch(e){

    // }

    return user;
  }
}
