

import 'package:doctor/blocs/sign_up_bloc/sign_up_bloc.dart';


import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../shared_between_pages/widgets/upload_profile_picture.dart';
import '../authentication_conponents/my_textfield.dart';
import '../authentication_conponents/other_method_button.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  const SignUpPage({super.key, required this.toggleView});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signUpRequired = true;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword1 = true;
    bool obscurePassword = true;
  bool isEnabled = false;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if(state is SignUpSuccess){
                  setState(() {
                    signUpRequired = false;
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const UploadProfilePicture() ));
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const ExploreBar()));
                } else if(state is SignUpProcess){
                  signUpRequired = true;

                } else if(state is SignUpFailure){
                  return;
                }
              },
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const Text(
                          "TheSpecialist",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                              fontFamily: "arial-bold"),
                        ),
                        const Text(
                          "Welcome back ,youv've been missed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "arial",
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MyTextField(
                          readOnly: false,
                          errorMsg: _errorMsg,
                          controller: _fullName,
                          hintText: "FullName",
                          obscureText: false,
                          keyboardType: TextInputType.name,
                          prefixIcon: const Icon(
                            Iconsax.user,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          readOnly: false,
                          errorMsg: _errorMsg,
                          controller: _emailController,
                          hintText: "Email",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(
                            CupertinoIcons.mail_solid,
                            color: primaryColor,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                                .hasMatch(val)) {
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          readOnly:false,
                          errorMsg: _errorMsg,
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: obscurePassword,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword =!obscurePassword;
                                  if (obscurePassword) {
                                    iconPassword = CupertinoIcons.eye_fill;
                                  } else {
                                    iconPassword =
                                        CupertinoIcons.eye_slash_fill;
                                  }
                                });
                              },
                              icon: Icon(iconPassword)),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            }
                            return null; /*else if (!RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@&*-]).{8,},").hasMatch(val)) {
                              return 'please enter a valid password';*/
                            
                           // return null;
                          }, 
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          errorMsg: _errorMsg,
                          controller: _confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: obscurePassword1,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword1=!obscurePassword1;
                                  if (obscurePassword) {
                                    iconPassword = CupertinoIcons.eye_fill;
                                  } else {
                                    iconPassword = CupertinoIcons.eye_slash_fill;
                                  }
                                });
                              },
                              icon: Icon(iconPassword)),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return 'please enter a valid password';
                            }
                            return null;
                          }, readOnly: false,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                       signUpRequired?
                         SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          height: KToolbarHeight,
          child: TextButton(
            onPressed:() { 
              if (_formKey.currentState!.validate()) {
                
                            MyUser myUser = MyUser.empty;
                            myUser = myUser.copyWith(
                              email: _emailController.text,
                              fullname: _fullName.text,
                             password: _passwordController.text,
                            );
                            setState(() {
                               context.read<SignUpBloc>().add(
                              SignUpRequired(myUser, _passwordController.text));
                              
                            });
            }
            },
            style: TextButton.styleFrom(
              elevation: 4.0,
              backgroundColor: primaryColor,
              foregroundColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)
              )
            ),

            child:const Padding(
              padding:   EdgeInsets.symmetric(horizontal:25,vertical: 2) ,
                child: Text("Sign Up",
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: bgColor,
                  fontSize: 18,
                  fontFamily: "arial-bold",
                ),
                ),
                        ) 
            ,),
    ):const CircularProgressIndicator(),
                        
                       /* MyButton(title: "Sign Up", onTap: () {
                          if (_formKey.currentState!.validate()) {
                            MyUser myUser = MyUser.empty;
                            myUser = myUser.copyWith(
                              email: _emailController.text,
                              fullname: _fullName.text,
                            );
                            setState(() {
                               context.read<SignUpBloc>().add(
                              SignUpRequired(myUser, _passwordController.text));
                              
                            });
                           print(myUser.email);
                            
                          }
                        }),*/
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                indent: 40,
                                endIndent: 5,
                              )),
                              Text("Or"),
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                indent: 5,
                                endIndent: 40,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OtherMethodButton(
                            name: " Sign Up with Google",
                            lead: SvgPicture.asset(
                                "lib/asset/images/icons8-google.svg",
                                width: 30,
                                height: 30),
                            onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        OtherMethodButton(
                            name: "Sign Up with Apple",
                            lead: SvgPicture.asset(
                              "lib/asset/images/icons8-mac-os.svg",
                              width: 30,
                              height: 30,
                            ),
                            onPressed: () {}),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account ?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              TextButton(
                                  onPressed: () {
                                    widget.toggleView();
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ])
                      ],
                    ),
                  )),
            );
  }
}
