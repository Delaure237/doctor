import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../doctor_repository.dart';



class FirebaseDoctorRepo implements DoctorRepository {

  final doctorCollection = FirebaseFirestore.instance.collection("doctor");
 //sReference storageReference = FirebaseStorage.instance.ref("doctor/profilPicture/");
 final FirebaseAuth _firebaseAuth;
 FirebaseDoctorRepo({
  FirebaseAuth? firebaseAuth,
 }) : _firebaseAuth =firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get doctor {
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
  Future<MyDoctor> signUp(MyDoctor myDoctor,String password) async {
    try{
 UserCredential user = await  _firebaseAuth.createUserWithEmailAndPassword(
  email: myDoctor.email, 
  password: password);
  myDoctor = myDoctor.copyWith(userId: user.user!.uid);
    }catch(e){
      log(e.toString());
    }
return  myDoctor;
  }

  

  @override
  Future<void> setUserData(MyDoctor myDoctor ) async {
    try{

       await  doctorCollection
       .doc(myDoctor.userId)
       .set(myDoctor.toEntity().toDocument());
    }catch(e){
      log(e.toString());
    }

  }
  @override
  Future<void> uploadProfilePicture() async {
    try {
      
    } catch (e) {
      log(e.toString());
    }
  }
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }


 }
