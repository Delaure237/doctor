// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:io';

import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_repository/user_repository.dart';
import 'package:doctor/src/pages/home/homepage_conponent/nav_bar.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/shared/widgets/my_button.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../bloc/doctor_bloc/dr_signup_bloc/bloc/dr_signup_bloc.dart';
import '../../../../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../../app_type/chat/chat.dart';


class UploadProfilePicture extends StatefulWidget {
  const UploadProfilePicture({super.key});

  @override
  State<UploadProfilePicture> createState() => _UploadProfilePictureState();
}

class _UploadProfilePictureState extends State<UploadProfilePicture> {
  File? imageFile;
  final _picker = ImagePicker();

  Future<void> _uploadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('user_type'); // "doctor" ou "patient"
    final isDoctor = userType == 'doctor';

    if (imageFile == null) {
      return;
    }

    try {
      final userId = await _getUserId(isDoctor);

      await _uploadProfilePicture(userId, imageFile!, isDoctor: isDoctor);

      // Mettre à jour le statut d'authentification
      await prefs.setBool('is_authenticated', true);

      if (mounted) { // Vérifie si le widget est toujours monté avant de naviguer
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const  ExploreBar()

          ),
        );
      }
    } catch (e) {
      log("Error uploading image: $e");
    }
  }

  Future<String> _getUserId(bool isDoctor) async {
    if (isDoctor) {
      return context.read<DrSignupBloc>().doctor.userId;
    } else {
      return context.read<SignUpBloc>().user.userId;
    }
  }





Future<void> _uploadProfilePicture(String userId, File imageFile, {required bool isDoctor}) async {
  if (isDoctor) {
    final doctorRepository = context.read<DoctorRepository>();
    await doctorRepository.uploadProfilePicture(userId, imageFile);
  } else {
    final userRepository = context.read<UserRepository>();
    await userRepository.uploadProfilePicture(userId, imageFile);
  }
}


  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "TheSpecialist",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                    fontFamily: "arial-bold",
                  ),
                ),
                Text(
                  "Choose a profile Picture",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: imageFile != null
                          ? FileImage(imageFile!)
                          : const AssetImage("lib/asset/images/placeholder.png") as ImageProvider,
                      backgroundColor: unfocusColor,
                      radius: 100,
                    ),
                    Positioned(
                      top: 160,
                      left: 150,
                      child: GestureDetector(
                        onTap: () => _scaffoldKey.currentState?.showBottomSheet((ctx) => _buildBottomSheet(ctx)),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Icon(Iconsax.camera5, color: bgColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                // Button to upload the image
                MyButton(
                  onTap: () {
                    _uploadImage();
                  },
                  text: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _pickImageFromCamera();
              },
              child: Row(
                children: [
                  const Icon(Iconsax.camera5),
                  const SizedBox(width: 12),
                  title("Pick from camera"),
                ],
              ),
            ),
            const Divider(thickness: 2),
            GestureDetector(
              onTap: () {
                _pickImageFromGallery();
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(Iconsax.gallery5),
                  const SizedBox(width: 12),
                  title("Pick from Gallery"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text title(String txt) => Text(
    txt,
    textAlign: TextAlign.center,
    style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
