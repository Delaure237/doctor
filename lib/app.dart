
import 'package:doctor/app_view.dart';
import 'package:doctor/blocs/account_type/bloc/account_type_bloc.dart';
import 'package:doctor/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/bloc/dr_signin_bloc.dart';
import 'package:doctor/blocs/doctor_bloc/doctor_auth_bloc/bloc/doctor_auth_bloc.dart';
import 'package:doctor/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:doctor/src/pages/homepage/homepage_conponent/nav_bar.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final DoctorRepository doctorRepository;
  final UserRepository userRepository;
  const MyApp(this.userRepository,  this.doctorRepository, {super.key});
 
  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<AccountTypeBloc>(
      lazy: true,
      create: (context) => AccountTypeBloc()..add(LoadAccountEvent()), 
      child: MyAppView(userRepository: userRepository, doctorRepository: doctorRepository)
      ),
      BlocProvider(   
    create: (context) => DrSignInBloc(
      doctorRepository: context.read<DoctorAuthBlocBloc>().doctorRepository),
      child: const ExploreBar(),
    ),
      BlocProvider(
       
    create: (context) => SignInBloc(
      userRepository: context.read<AuthenticationBloc>().userRepository,
    ),
                ),
      ], child:MyAppView(userRepository: userRepository, doctorRepository: doctorRepository) ,
      
    );
    
   
   
  }
}