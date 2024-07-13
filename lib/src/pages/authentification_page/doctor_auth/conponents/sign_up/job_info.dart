// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:doctor/src/pages/authentification_page/authentication_conponents/my_button.dart';

import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/my_text_field.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/sign_up/description.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/pick_localisation.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/subtitle.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../shared_between_pages/constant/constant.dart';




class WorkInfo extends StatefulWidget {
  const WorkInfo({super.key});

  @override
  State<WorkInfo> createState() => _WorkInfoState();
}

class _WorkInfoState extends State<WorkInfo> {
  @override
  Widget build(BuildContext context) {
   final _formKey = GlobalKey<FormState>();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController placeofServiceController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  String? _errorMsg;
    return Scaffold(
    body:
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:const  EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   const SizedBox(height:70),
                    const Text("TheSpecialist",style: TextStyle(color: primaryColor,fontSize: 24,fontFamily: "arial-bold"),),
                     const  SizedBox(height: 30,),
                   const  Subtitle(sub: "Add your professional Information"),
                       const  SizedBox(height: 30,),
                       MyTextFormField(controller: specialityController,
                       readOnly: false,
                       errorMsg: _errorMsg,
                       hintText: "Speciality", 
                       obscureText: false, 
                       keyboardType: TextInputType.name, 
                       labelText: "Speciality",
                      // prefixIcon: const Icon(Iconsax.user,color: primaryColor,),
                       ),
                     const  SizedBox(height: 20,),
                        MyTextFormField(controller: placeofServiceController, 
                        readOnly: true,
                        errorMsg: _errorMsg,
                        onTap: (){
                          setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PickLocalisation()));
                          });
                        
                        },
                        hintText: "place of service", 
                       obscureText: false, 
                       keyboardType: TextInputType.name, 
                       labelText: "Place of service", 
                      
                       ),
                       const  SizedBox(height: 20,),
                       MyTextFormField(
                        errorMsg: _errorMsg,
                        readOnly: false,
                        controller: experienceController, 
                        hintText: "Years of experience", 
                        obscureText: false, 
                        keyboardType: TextInputType.datetime, 
                        labelText: "Years of experience"),
              
                        const  SizedBox(height: 30,),
                        SizedBox(
                          child: TextField(
                            
                            readOnly: true,
                            decoration: InputDecoration(
                              error: Text(_errorMsg!),
                              hintStyle: GoogleFonts.poppins(),
                              suffixIcon: const Icon(Iconsax.folder_25,color: primaryColor,),
                               hintText: "Upload your license to practice",
                               border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                               )
                            ),
                          ),
                        ),
                         const  SizedBox(height: 30,),
                        MyButton(title: "Continuer", onTap: (){
                           if (_formKey.currentState!.validate()) {
                            MyDoctor myDoctor = MyDoctor.empty;
                            myDoctor = myDoctor.copyWith(
                              speciality: specialityController.text,
                                experience: experienceController.hashCode,
                                place: placeofServiceController.text,
                                path: licenseController.text,
                            
                            );
                             
                                                     
                             Navigator.push(context, MaterialPageRoute(builder:   (context) =>const Description()));
                              }
                         
                        }),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    )
    );
  }
}