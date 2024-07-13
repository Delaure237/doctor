// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:doctor/src/pages/authentification_page/authentication_conponents/my_button.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/my_text_field.dart';
import 'package:doctor/src/pages/authentification_page/doctor_auth/conponents/sign_up/job_info.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/subtitle.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';


import '../../../../shared_between_pages/constant/constant.dart';





class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
 final _formKey = GlobalKey<FormState>();
 String? _errorMsg;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
     final TextEditingController nameController = TextEditingController();
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
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const SizedBox(height:70),
                    const Text("TheSpecialist",style: TextStyle(color: primaryColor,fontSize: 24,fontFamily: "arial-bold"),),
                     
                   const  Subtitle(sub:"Add your personnal information"),
                       const  SizedBox(height: 30,),
                       MyTextFormField(controller: firstNameController,
                       hintText: "First Name", 
                       obscureText: false, 
                       errorMsg: _errorMsg,
                       keyboardType: TextInputType.name, 
                       labelText: "First Name", readOnly: false,
                       validator: (val){
                          if (val!.isEmpty) {
                            return "please fill this field";
                          }
                          return null;
                        },
                      // prefixIcon: const Icon(Iconsax.user,color: primaryColor,),
                       ),
                     const  SizedBox(height: 26,),
                        MyTextFormField(controller: nameController, 
                       hintText: "Name", 
                       errorMsg: _errorMsg,
                       obscureText: false, 
                       keyboardType: TextInputType.name, 
                       labelText: "Name", readOnly: false, 
                       validator: (val){
                          if (val!.isEmpty) {
                            return "please fill this field";
                          }
                          return null;
                        },
                      
                       ),
                       const  SizedBox(height: 26,),
                       MyTextFormField(
                        errorMsg: _errorMsg,
                        controller: passwordController, 
                        hintText: "Date of birth", 
                        obscureText: false, 
                        keyboardType: TextInputType.datetime, labelText: "Date of birth", 
                        readOnly: false,
                        validator: (val){
                          if (val!.isEmpty) {
                            return "please fill this field";
                          }
                          return null;
                        },
                        ),
                        const  SizedBox(height: 40,),
                        MyButton(title: "Next", onTap: (){
                           if (_formKey.currentState!.validate()) {
                            MyDoctor myDoctor = MyDoctor.empty;
                            myDoctor = myDoctor.copyWith(
                              name: nameController.text,
                              firstname: firstNameController.text);
                               setState(() {

                             Navigator.push(context, MaterialPageRoute(builder:   (context) => const WorkInfo()));
                          });                           
                           
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