// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:user_repository/src/entities/user_entity.dart';
import 'models/user.dart';
import 'user_repo.dart';

class FirebaseUserRepo implements UserRepository {

  final FirebaseAuth _firebaseAuth;
  final CollectionReference _userCollection;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;



  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _userCollection = FirebaseFirestore.instance.collection("users");

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    } );
  }

  @override
Future<MyUser?> getUserData(String userId) async {
    try {
      // Utilisez l'ID utilisateur pour obtenir le document correspondant
      final userDoc = await _userCollection.doc(userId).get();
      if (userDoc.exists) {
        // Convertissez le document en un objet MyUser
        final userData = userDoc.data() as Map<String,dynamic>;
        return MyUser.fromEntity(MyUserEntity.fromDocument(userData));
            } else {
        print("User not found for ID: $userId");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
}

//signIn with Email and password
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
@override
Future<MyUser> signUp(MyUser myUser, String password) async {
  try {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: myUser.email,
      password: password,
    );
    myUser = myUser.copyWith(userId: userCredential.user!.uid);

    // Ajout de logs pour déboguer
    print('User created with ID: ${myUser.userId}');
   // await setUserData(myUser);

    return myUser;
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}


  @override
 Future<void> setUserData(MyUser myUser) async {
  try {
    print('Setting user data for ID: ${myUser.userId}');
    await _userCollection.doc(myUser.userId).set(myUser.toEntity().toDocument());
    print('User data set successfully');
  } catch (e) {
    print('Error setting user data: $e');
  }
}


  @override
  Future<void> uploadProfilePicture(String userId, File imageFile) async {
    try {
      final storageRef = _firebaseStorage.ref('profile_pictures/$userId');
      final uploadTask = storageRef.putFile(imageFile);
      final uploadSnapshot = await uploadTask;
      final downloadURL = await uploadSnapshot.ref.getDownloadURL();
      await _userCollection.doc(userId).update({'path': downloadURL});
      print('Profile picture uploaded successfully: $downloadURL');
    } catch (e) {
      print('Failed to upload profile picture: $e');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log('Failed to log out: $e');
    }
  }

  @override
  Future<void> saveUserData(MyUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', user.fullname);
      await prefs.setString('userEmail', user.email);
    } catch (e) {
      log('Failed to save user data to local: $e');
    }
  }

  @override
  Future<MyUser?> loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userName = prefs.getString('userName');
      final userEmail = prefs.getString('userEmail');
      if (userName != null && userEmail != null) {
        return MyUser(
          userId: '',
          fullname: userName,
          email: userEmail,
          password: '',
         // path: '',
        );
      }
      return null;
    } catch (e) {
      log('Failed to load user data from local: $e');
      return null;
    }
  }

@override
Future<String> getUserNameById(String userId) async {
  try {
    final userDoc = await  _userCollection.doc(userId).get();
    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;
      return userData['name'] ?? 'Unknown';
    } else {
      print("user not found for ID: $userId");
      return 'Unknown';
    }
  } catch (e) {
    print("Error fetching user name: $e");
    return 'Unknown';
  }
}

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      log('Google sign-in failed: $e');
      rethrow;
    }
  }


}