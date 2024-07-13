
// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:doctor/src/pages/shared_between_pages/widgets/upload_profile_picture.dart';
import 'package:doctor_repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../blocs/doctor_bloc/dr_signup_bloc/bloc/dr_signup_bloc.dart';
import '../../../../homepage/homepage_conponent/nav_bar.dart';
import '../../../../shared_between_pages/constant/constant.dart';
import '../../../authentication_conponents/my_button.dart';
import '../my_text_field.dart';

class DoctorSignUp extends StatefulWidget {
  const DoctorSignUp({super.key});
  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  @override
  Widget build(BuildContext context) { 
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool dr_sign_in_required = true;
    return BlocListener<DrSignupBloc, DrSignupState>(
              listener: (context, state) {
                if(state is SignUpSuccess){
                  setState(() {
                    dr_sign_in_required = false;
                //  DrSignInRequired = false;
                  });
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const ExploreBar()));
                } else if(state is SignUpProcess){
                  //DrSignInRequired = true;
                    dr_sign_in_required  = true;
                } else if(state is SignUpFailure){
                  return;
                }
              },
          
            child: Form(
              key: _formKey,
              child: Padding(
  
            padding:const  EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: [
                     const SizedBox(height:70),
                      const Text("TheSpecialist",style: TextStyle(color: primaryColor,fontSize: 24,fontFamily: "arial-bold"),),
                       const  SizedBox(height: 50,),
                       const Text("Ajoutez vos informations personnelles",style: TextStyle(color: Colors.black,fontSize:26 ,fontWeight: FontWeight.bold),),
                         const  SizedBox(height: 30,),
                         MyTextFormField(controller: _emailController,
                         hintText: "Email", 
                         obscureText: false, 
                         keyboardType: TextInputType.name, 
                         labelText: "Email", readOnly: false,
                        // prefixIcon: const Icon(Iconsax.user,color: primaryColor,),
                         ),
                       const  SizedBox(height: 26,),
                          MyTextFormField(controller: _passwordController, 
                         hintText: "Password", 
                         obscureText: false, 
                         keyboardType: TextInputType.name, 
                         labelText: "Password", readOnly: false, 
                        
                         ),
                         const SizedBox(height: 24,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                         Checkbox(value: false, onChanged: (value){}),
                          const Text("Remenber me")
                          ],
                         ),
                       
                        
                          const  SizedBox(height: 40,),
                          MyButton(title: "Sign Up", onTap: (){
                              if (_formKey.currentState!.validate()) {
                                MyDoctor myDoctor = MyDoctor.empty;
                                myDoctor =myDoctor.copyWith(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                setState(() {
                                   context.read<DrSignupBloc>().add(
                                    DrSignUpRequired(myDoctor, _passwordController.text));
    
                                });
                }
                            Navigator.push(context, MaterialPageRoute(builder:   (context) =>const UploadProfilePicture()));
                          }),
                  ],
                ),
              ),
            ),
    
    );
  }
}