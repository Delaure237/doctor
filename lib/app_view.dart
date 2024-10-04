
import 'package:appointment_repository/appointment_repository.dart';

import 'package:doctor/src/pages/auth/doctor_auth/conponents/sign_up/sign_up.dart';
import 'package:doctor/src/pages/onboarding_page/components/splash_screen.dart';
import 'package:doctor/src/pages/onboarding_page/onboarding_screen.dart';
import 'package:doctor/src/pages/userprofile_page/user_profile_page.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_repository/user_repository.dart';
import 'bloc/doctor_bloc/dr_signup_bloc/bloc/dr_signup_bloc.dart';
import 'src/pages/home/homepage_conponent/nav_bar.dart';


class MyAppView extends StatelessWidget {
  final UserRepository userRepository;
  final DoctorRepository doctorRepository;
  final AppointmentRepository appointmentRepository;

  const MyAppView({
    super.key,
    required this.userRepository,
    required this.doctorRepository,
     required this.appointmentRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: "/",
      home:  const SplashScreen(), // Début avec la SplashScreen
      routes: {
        'onboarding' :(context) => const OnboardingPage(),
        '/userProfile': (context) => BlocProvider(
          create: (context) => DrSignupBloc(
            doctorRepository: doctorRepository,
          ),
          child: const UserProfilePage(),
        ),
        
        '/doctorSignUp': (context) => BlocProvider(
          create: (context) => DrSignupBloc(
            doctorRepository: doctorRepository,
          ),
          child: const DoctorSignUp(),
        ),
        '/doctor': (context) => const ExploreBar(), // Mettez à jour les routes selon les besoins
        '/patient': (context) => const ExploreBar(),


      },
    );
  }
}