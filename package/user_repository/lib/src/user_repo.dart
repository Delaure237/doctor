



import 'dart:io';

import 'package:user_repository/user_repository.dart';

import 'models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository{
  

Stream<User?> get user;

Future<MyUser> signUp(MyUser myUser,String password);

Future<void> setUserData(MyUser user);

Future<void> fetchUserData(MyUser user);

Future<void> signIn(String email,String password);
Future<void> logOut();

Future<void> addProfilePicture(MyUser user, File imageFile);

}
