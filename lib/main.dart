import 'package:appointment_repository/appointment_repository.dart';
import 'package:doctor/app.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:doctor/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_repository/user_repository.dart';



void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   runApp(MyApp(FirebaseUserRepo(), FirebaseDoctorRepo(), FirebaseAppointmentRepo(),));

}
 
 






                                                                                                  