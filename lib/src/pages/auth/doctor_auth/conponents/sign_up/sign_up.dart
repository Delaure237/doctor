// ignore_for_file: unused_local_variable, unused_import, use_build_context_synchronously

import 'dart:developer';

import 'package:doctor/src/pages/shared/widgets/upload_profile_picture.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../bloc/doctor_bloc/dr_signup_bloc/bloc/dr_signup_bloc.dart';
import '../../../../home/homepage_conponent/nav_bar.dart';
import '../../../../shared/constant/constant.dart';
import '../../../authentication_conponents/my_button.dart';
import '../my_text_field.dart';

class DoctorSignUp extends StatefulWidget {
  const DoctorSignUp({super.key});

  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadSignUpData();
  }

  void _loadSignUpData() async {
    final prefs = await SharedPreferences.getInstance();
    // Charger d'autres données si nécessaire
  }

  bool _validateEmail(String value) {
    final regex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return regex.hasMatch(value);
  }

  bool _validatePassword(String value) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrSignupBloc, DrSignupState>(
      listener: (context, state) async {
        if (state is SignUpSuccess) {
          setState(() {
            _isLoading = false;
          });
          // On s'assure que tout est terminé avant de naviguer
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const ExploreBar()),
              (Route<dynamic> route) => false,
            );
          }
        } else if (state is SignUpFailure) {
          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 5),
                dismissDirection: DismissDirection.down,
                content: Text('Sign up failed'),
              ),
            );
          }
        } else if (state is SignUpProcess) {
          setState(() {
            _isLoading = true;
          });
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Text(
                      "TheSpecialist",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontFamily: "arial-bold",
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Register using your email & password",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    MyTextForm(
                      controller: _emailController,
                      hintText: "Email",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      labelText: "Email",
                      readOnly: false,
                      validator: (value) {
                        if (value == null || !_validateEmail(value)) {
                          return 'Entrez une adresse email valide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 26),
                    MyTextForm(
                      controller: _passwordController,
                      hintText: "Password",
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      labelText: "Password",
                      readOnly: false,
                      validator: (value) {
                        if (value == null || !_validatePassword(value)) {
                          return 'Le mot de passe doit comporter au moins 8 caractères, dont une lettre et un chiffre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("Remember me"),
                      ],
                    ),
                    const SizedBox(height: 40),
                    MyButton(
                      title: "Sign Up",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final prefs = await SharedPreferences.getInstance();

                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          final firstName = prefs.getString('firstname') ?? '';
                          final name = prefs.getString('name') ?? '';
                          final dob = prefs.getString('Dob') ?? '';
                          final speciality = prefs.getString('speciality') ?? '';
                          final placeOfService = prefs.getString('placeOfService') ?? '';
                          final experience = prefs.getInt('experience') ?? 0;
                          final license = prefs.getString('license') ?? '';
                          final description = prefs.getString('description') ?? '';

                          MyDoctor myDoctor = MyDoctor.empty.copyWith(
                            email: email,
                            password: password,
                            firstname: firstName,
                            name: name,
                            dob: dob,
                            speciality: speciality,
                            place: placeOfService,
                            experience: experience,
                            path: license,
                            about: description,
                          );

                          setState(() {
                            context.read<DrSignupBloc>().add(
                              DrSignUpRequired(myDoctor, password),
                            );
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
