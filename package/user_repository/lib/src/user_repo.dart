import 'dart:io';
import 'models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser user);


  Future<void> signIn(String email, String password);

  Future<void> logOut();

 Future<void> uploadProfilePicture(String userId, File imageFile);

  Future<void> saveUserData(MyUser user);
  
Future<String> getUserNameById(String userId) ;

Future<MyUser?> loadUserData();
Future<MyUser?> getUserData(String userId);


}
