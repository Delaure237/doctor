

// ignore_for_file: prefer_collection_literals

import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/entities/user_entity.dart';
import 'models/user.dart';
import 'user_repo.dart';

class FirebaseUserRepo implements UserRepository {

  final userCollection = FirebaseFirestore.instance.collection("user");
 final FirebaseAuth _firebaseAuth;
 FirebaseUserRepo({
  FirebaseAuth? firebaseAuth,
 }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
             return _firebaseAuth.authStateChanges()
             .map((firebaseUser) {
              return firebaseUser;
             });
  }

  @override
  Future<void> signIn(String email,String password) async {
    try{
await _firebaseAuth.signInWithEmailAndPassword(
  email: email, 
  password: password
  );
    }catch(e){
      log(e.toString());
    }

  }

  @override
  Future<MyUser> signUp(MyUser myUser,String password) async {
    try{
 UserCredential user = await  _firebaseAuth.createUserWithEmailAndPassword(
  email: myUser.email, 
  password: password);
  myUser = myUser.copyWith(userId: user.user!.uid);
    }catch(e){
      log(e.toString());
    }
return  myUser;
  }

  

  @override
  Future<void> setUserData(MyUser myUser ) async {
    try{

       await  userCollection
       .doc(myUser.userId)
       .set(myUser.toEntity().toDocument());
    }catch(e){
      log(e.toString());
    }

  }
 
  
  @override
  Future<MyUser> fetchUserData(MyUser myUser)  async {
   try {
    return await userCollection
     .doc(myUser.userId)
     .get().then((e) => 
     MyUser. fromEntity(MyUserEntity.fromDocument(e.data()??  Map()))
     );
   } catch (e) {
log(e.toString());
rethrow;
   }
  }
  @override


 @override
  Future<void> addProfilePicture(MyUser user, File imageFile) async {
    try {
      // Create a reference to the user's profile picture storage location
      final storageRef = FirebaseStorage.instance.ref('profile_pictures/${user.userId}');

      // Upload the image file to the storage reference
      final uploadTask = storageRef.putFile(imageFile);
      final uploadSnapshot = await uploadTask;

      // Get the download URL of the uploaded image
      final downloadURL = await uploadSnapshot.ref.getDownloadURL();

      // Update the `profilePictureUrl` field in the Firestore document
      final userRef = FirebaseFirestore.instance.collection('user').doc(user.userId);
      await userRef.update({
        'profilePictureUrl': downloadURL, // Update the 'profilePictureUrl' field with the download URL
      });

      log('Profile picture uploaded successfully: $downloadURL');
    } catch (e) {
      log('Failed to upload profile picture: $e');
    }
  }

  
  @override
  Future<void> logOut() async  {
    await _firebaseAuth.signOut();
  }

 }


