

// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import "package:firebase_storage/firebase_storage.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../doctor_repository.dart';

class FirebaseDoctorRepo implements DoctorRepository {
  //to create firestore instance
  final doctorCollection = FirebaseFirestore.instance.collection("doctors");
  final FirebaseAuth _firebaseAuth;
   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseDoctorRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

//get a stream of user
  @override
  Stream<User?> get doctor {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      log("Auth state changed: ${firebaseUser?.email ?? 'No user'}");
      return firebaseUser;
    });
  }
//doctor signIn
  @override
  Future<void> signIn(String email, String password) async {
    try {
      log("Signing in with email: $email");
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      log("Sign-in successful for email: $email");
    } catch (e) {
      log("Error signing in: $e");
      rethrow;
    }
  }
//doctor sign up function
  @override
Future<MyDoctor> drSignUp(MyDoctor myDoctor, String password) async {
  try {
    if (myDoctor.email.isEmpty) {
      throw Exception('Email is missing');
    }

    log("Creating user with email: ${myDoctor.email}");
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: myDoctor.email,
      password: password,
    );

    log("User created with UID: ${userCredential.user!.uid}");

    // Mise à jour de l'objet MyDoctor avec le userId
    myDoctor = myDoctor.copyWith(userId: userCredential.user!.uid);

    await doctorCollection.doc(userCredential.user!.uid).set({
      'firstname': myDoctor.firstname,
      'name': myDoctor.name,
      'email': myDoctor.email,
      'password': myDoctor.password,
      'dob': myDoctor.dob,
      'speciality': myDoctor.speciality,
      'experience': myDoctor.experience,
      'about': myDoctor.about,
      'place': myDoctor.place,
      'path' :myDoctor.path
    });

    log("Doctor data set for UID: ${userCredential.user!.uid}");

    // Assurez-vous que les données utilisateur sont correctement définies
    await setUserData(myDoctor);

    return myDoctor;
  } catch (e) {
    log("Error in drSignUp: $e");
    rethrow;
  }
}

//set user Datas
  @override

//get all doctors datas
Future<void> setUserData(MyDoctor doctor) async {
  try {
    if (doctor.userId.isEmpty) {
      throw Exception('User ID is missing');
    }
    log("Setting user data for UID: ${doctor.userId} with email: ${doctor.email}");
    await doctorCollection.doc(doctor.userId).set(doctor.toEntity().toDocument());
    log("User data set for UID: ${doctor.userId}");
  } catch (e) {
    log("Error in setUserData: $e");
    rethrow;
  }
}

@override
Stream<List<MyDoctor>> fetchAllDoctorsStream() {
  try {
    return doctorCollection.snapshots().map(
      (snapshot) => snapshot.docs.map(
        (doc) => MyDoctor.fromEntity(MyDoctorEntity.fromDocument(doc.data()))
      ).toList()
    );
  } catch (e) {
    print("Failed to fetch doctors: $e");
    return Stream.error("Failed to fetch doctors");
  }
}


@override

 Future<String> getDoctorNameById(String doctorId) async {
    try {
      final doctorDoc = await doctorCollection.doc(doctorId).get();
      if (doctorDoc.exists) {
        final doctorData = doctorDoc.data() as Map<String, dynamic>;
        return doctorData['name'] ?? 'Unknown';
      } else {
        print("Doctor not found for ID: $doctorId");
        return 'Unknown';
      }
    } catch (e) {
      print("Error fetching doctor name: $e");
      return 'Unknown';
    }
  }
/*  Future<List<MyDoctor>> fetchAllDoctors() async {
    try {
      log("Fetching all doctors");
      final querySnapshot = await doctorCollection.get();
      log("Fetched ${querySnapshot.docs.length} doctors");
      return querySnapshot.docs.map((doc) {
        log("Processing document with ID: ${doc.id}");
        return MyDoctor.fromEntity(MyDoctorEntity.fromDocument(doc.data()));
      }).toList();
    } catch (e) {
      log("Error fetching doctors: $e");
      rethrow;
    }
  }*/
  //getDoctorData
   @override
Future<MyDoctor?> geDoctorData(String userId) async {
    try {
      // Utilisez l'ID utilisateur pour obtenir le document correspondant
      final userDoc = await doctorCollection.doc(userId).get();
      if (userDoc.exists) {
        // Convertissez le document en un objet MyUser
        final userData = userDoc.data() as Map<String,dynamic>;
        return MyDoctor.fromEntity(MyDoctorEntity.fromDocument(userData));
            } else {
        print("User not found for ID: $userId");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
}
//to upload profile picture
  @override
  Future<void> uploadProfilePicture(String doctorId, File imageFile) async {
    try {
      final storageRef = _firebaseStorage.ref('profile_pictures/$doctorId');
      final uploadTask = storageRef.putFile(imageFile);
      final uploadSnapshot = await uploadTask;
      final downloadURL = await uploadSnapshot.ref.getDownloadURL();
      await doctorCollection.doc(doctorId).update({'path': downloadURL});
      print('Profile picture uploaded successfully: $downloadURL');
    } catch (e) {
      print('Failed to upload profile picture: $e');
    }
  }
//to user logOut
  @override
  Future<void> logOut() async {
    try {
      log("Logging out");
      await _firebaseAuth.signOut();
      log("Logged out successfully");
    } catch (e) {
      log("Error logging out: $e");
      rethrow;
    }
  }
}
