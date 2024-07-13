// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/my_button.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../homepage/homepage_conponent/nav_bar.dart';

class UploadProfilePicture extends StatefulWidget {
  const UploadProfilePicture({super.key});

  @override
  State<UploadProfilePicture> createState() => _UploadProfilePictureState();
}

class _UploadProfilePictureState extends State<UploadProfilePicture> {
  File? imageFile;
  final _picker = ImagePicker();
  Future<void> _uploadImageToFirebase() async {
    MyUser? user ;
    if (imageFile == null) {
      // Show an error message or handle case where no image is selected
      return;
    }

    try {
      // Create a reference to the storage location
      final storageRef = FirebaseStorage.instance.ref('profile_pictures/${user!.userId}');

      // Upload the image file to the storage reference
      await storageRef.putFile(imageFile!);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const ExploreBar()));
      // Get the download URL of the uploaded image
     // final downloadURL = await storageRef.getDownloadURL();

      // Perform any additional logic like updating the user profile with the download URL
      // For example:
      // await widget.userRepository.updateUserProfileImage(currentUser, downloadURL);
      
      // Navigate to the next screen or perform any other action
    } catch (e) {
      // Handle errors
      
    }
  }
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null){
         setState(() {
           imageFile = File(pickedFile.path);
         });
    }
  }
    Future<void> _pickImageFromCamera() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile!=null) {
        setState(() {
          imageFile =File(pickedFile.path);
        });
      }
    }
   
   
    
  
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
       body: SafeArea(
        child:Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100,),
                 const Text(
                            "TheSpecialist",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 24,
                                fontFamily: "arial-bold"),
                          ),
                           Text(
                            "Choose a profil Picture",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                               // fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                            ),
                          ),
                         const  SizedBox(height: 80,),
                Stack(
                 // fit: StackFit.passthrough,
                  children: <Widget>[
                       CircleAvatar(
                        backgroundImage: imageFile != null ? FileImage(imageFile!) :const  AssetImage("lib/asset/images/placeholder.png") as ImageProvider,
                        backgroundColor: unfocusColor,
                        radius: 100,
                      //foregroundColor: Colors.grey,
                ),
                Positioned(
                  top: 160,
                  left: 150,
                  child: GestureDetector(
                   onTap: () =>_scaffoldKey.currentState?.showBottomSheet((ctx)=> _buildBottomSheet(ctx)),
                    child:Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: const Icon(Iconsax.camera5,color: bgColor,),
                    ) ,
                  )
                  )
                  ],
                ),
                const  SizedBox(height: 80,),
                //le bouton pour upload l'image dans firebase
                MyButton(onTap: (){
                 _uploadImageToFirebase();
                }, text: "Next")
               
              ],
            ),
          ),
        ) ,),
    );
  }
   Container _buildBottomSheet(BuildContext context){
      return Container(
       height: 200,
       padding:const  EdgeInsets.all(0.0),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0)

       ),
       child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                _pickImageFromCamera();
              },
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 const  Icon(Iconsax.camera5),
                const SizedBox(width: 12,),
                   title("Pick from camera")
                ],
              ),
            ),
            const Divider(thickness: 2,),
            
                GestureDetector(
                  onTap: (){
                    _pickImageFromGallery();
                    Navigator.pop(context);
                  },
                  child: Row(
                  children: [
                    const Icon(Iconsax.gallery5),
                     const SizedBox(width: 12,),
                     title("Pick from Gallery")
                  ],
                           ),
                ),
             
          ],
         ),
       ),
      );
    }

  Text title(String txt) =>Text(
                            txt,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                               // fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                            ));
}