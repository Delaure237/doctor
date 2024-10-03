import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/constant/constant.dart';
import '../../../../shared/widgets/slide_transition.dart';
import '../../../authentication_conponents/my_button.dart';
import '../../pick_localisation.dart';
import '../my_text_field.dart';
import 'description.dart';

class WorkInfo extends StatefulWidget {
  const WorkInfo({super.key});

  @override
  State<WorkInfo> createState() => _WorkInfoState();
}

class _WorkInfoState extends State<WorkInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController placeofServiceController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _loadWorkInfo();
  }

  void _loadWorkInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('firstname') ?? ''; // Récupération du prénom
    final dateOfBirth = prefs.getString('Dob') ?? ''; // Récupération de la date de naissance
    setState(() {
      specialityController.text = prefs.getString('speciality') ?? '';
      placeofServiceController.text = prefs.getString('placeOfService') ?? '';
      experienceController.text = prefs.getString('experience') ?? '';
      final licenseName = '${firstName}_licence'; // Utilisation du prénom pour la licence
      licenseController.text = prefs.getString('license') ?? licenseName;
      log("Date of Birth: $dateOfBirth"); // Assurez-vous que la date de naissance est correctement chargée
    });
  }

  @override
  void dispose() {
    specialityController.dispose();
    placeofServiceController.dispose();
    experienceController.dispose();
    licenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      const Text(
                        "TheSpecialist",
                        style: TextStyle(color: primaryColor, fontSize: 24, fontFamily: "arial-bold"),
                      ),
                      const SizedBox(height: 30),
                      Text("Add your professional information",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      MyTextForm(
                        controller: specialityController,
                        readOnly: false,
                        errorMsg: _errorMsg,
                        hintText: "Speciality",
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        labelText: "Speciality",
                      ),
                      const SizedBox(height: 20),
                      MyTextForm(
                        controller: placeofServiceController,
                        readOnly: false,
                        errorMsg: _errorMsg,
                        onTap: () async {
                          // Ouvrir la page PickLocalisation et récupérer la localisation sélectionnée
                          final selectedLocation = await Navigator.push(
                            context, SlideTransition1(const PickLocalisation()),
                          );

                          if (selectedLocation != null) {
                            setState(() {
                              placeofServiceController.text = selectedLocation;
                            });
                          }
                        },
                        hintText: "Place of service",
                        obscureText: false,
                        keyboardType: TextInputType.name,
                        labelText: "Place of service",
                      ),
                      const SizedBox(height: 20),
                      MyTextForm(
                        controller: experienceController,
                        readOnly: false,
                        errorMsg: _errorMsg,
                        hintText: "Years of experience",
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        labelText: "Years of experience",
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: licenseController,
                        readOnly: true,
                        decoration: InputDecoration(
                          errorText: _errorMsg,
                          hintStyle: GoogleFonts.poppins(),
                          suffixIcon: const Icon(Iconsax.folder_25, color: primaryColor),
                          hintText: "Upload your license to practice",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      MyButton(
                        title: "Continuer",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final prefs = await SharedPreferences.getInstance();
                            final experience = int.tryParse(experienceController.text) ?? 0;
                            await prefs.setString('speciality', specialityController.text);
                            await prefs.setString('placeOfService', placeofServiceController.text);
                            await prefs.setInt('experience', experience);
                            await prefs.setString('license', licenseController.text);
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Description()));
                              log("Professional info logged successfully");
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
