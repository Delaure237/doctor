import 'package:doctor/blocs/account_type/bloc/account_type_bloc.dart';

import 'package:doctor/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/doctor_auth_bloc/bloc/doctor_auth_bloc.dart';
import 'package:doctor/dr_app_view.dart';
import 'package:doctor/patient_app_view.dart';
import 'package:doctor/src/pages/onboarding_page/account_type.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyAppView extends StatelessWidget {
  final UserRepository userRepository;
  final DoctorRepository doctorRepository;
  const MyAppView({super.key, required this.userRepository, required this.doctorRepository});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      title: "Firebase Auth",
      home:BlocBuilder<AccountTypeBloc, AccountTypeState>(
        builder: (context, state) {
          if(state.selectedAccount == TypeOfAccount.doctor){
            return RepositoryProvider<DoctorAuthBlocBloc>(
              
              create: (context) => DoctorAuthBlocBloc(doctorRepository),
              child:const MyDrAppView(),
              );
          } else if(state.selectedAccount == TypeOfAccount.patient){
            return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository
      ),
      child: const MyPaAppView(),
        );
          } else {
            return const AccountType();
          }
           
        },
        
 
     
          
      )
      );
}
}