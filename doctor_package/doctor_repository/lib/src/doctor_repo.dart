import '../doctor_repository.dart';
import 'models/doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class DoctorRepository{
  

Stream<User?> get doctor;

Future<MyDoctor> signUp(MyDoctor myUser,String password);

Future<void> setUserData(MyDoctor doctor);

Future<void> signIn(String email,String password);

Future<void> logOut() ;

Future<void> uploadProfilePicture();
}
