
import 'package:appointment_repository/appointment_repository.dart';
import 'package:doctor/app_view.dart';
import 'package:doctor/bloc/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/bloc/appointment_bloc/create_appt_bloc/bloc/book_appt_bloc.dart';
import 'package:doctor/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:doctor/bloc/doctor_bloc/bloc/dr_signin_bloc.dart';
import 'package:doctor/bloc/doctor_bloc/doctor_auth_bloc/bloc/doctor_auth_bloc.dart';
import 'package:doctor/bloc/doctor_bloc/my_doctor_bloc/bloc/my_doctor_bloc.dart';
import 'package:doctor/bloc/my_user_bloc/my_user_bloc.dart';
import 'package:doctor/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:doctor/src/pages/home/homepage.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'bloc/appointment_bloc/get_appt_bloc/bloc/get_appt_bloc.dart';




class MyApp extends StatelessWidget {
  final DoctorRepository doctorRepository;
  final UserRepository userRepository;
  final AppointmentRepository appointmentRepository;

  const MyApp(
   this.userRepository,
   this.doctorRepository,
    this.appointmentRepository,
    {super.key, }
    
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Bloc pour gérer le type de compte
        BlocProvider<AccountTypeBloc>(
          create: (context) => AccountTypeBloc()..add(LoadAccountEvent()),
        ),
        // Bloc pour gérer l'authentification générale
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
          ),
        ),
        BlocProvider(
          create: (context) => SignInBloc(userRepository: context.read<AuthenticationBloc>().userRepository),
          child: const HomePage(),
        ),
        // Bloc pour gérer les données utilisateur
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository)..add(LoadUser()),
        ),
        // Bloc pour gérer l'authentification des médecins
        BlocProvider<DoctorAuthBlocBloc>(
          create: (context) => DoctorAuthBlocBloc(
            doctorRepository: doctorRepository,
          ),
        ),
        // Bloc pour gérer la connexion avec Google
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
            userRepository: userRepository,
           
          ),
          
        ),
        // Bloc pour gérer la connexion spécifique des médecins
        BlocProvider<DrSignInBloc>(
          create: (context) => DrSignInBloc(
            doctorRepository: doctorRepository,
          ),
        ),
        // Bloc pour gérer les informations des médecins
        BlocProvider<MyDoctorBloc>(
          create: (context) => MyDoctorBloc(doctorRepository)..add(LoadDoctors()),
        ),
        BlocProvider<BookApptBloc>(
          create:(context) =>BookApptBloc(appointmentRepo:appointmentRepository )
           
           ),
           BlocProvider<GetApptBloc>(
  create: (context) =>GetApptBloc(appointmentRepository: appointmentRepository, 
  userId: FirebaseAuth.instance.currentUser!.uid)..add(LoadAppointments(),
  )
  ),
      ],
        
      
      child: MyAppView(
        userRepository: userRepository,
        doctorRepository: doctorRepository, 
        appointmentRepository:appointmentRepository ,
      ),
    );
  }
}
