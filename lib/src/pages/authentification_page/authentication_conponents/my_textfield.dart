

import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool   obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final String? errorMsg;
  final FocusNode? focusNode;
  final Function(String?)? onchanged;
  final String? Function(String?)? validator;

  const MyTextField({super.key, 

  required this.controller, 
  required this.hintText, 
  required this.obscureText,
  required this.keyboardType,
  required this.readOnly,
   this.onTap,
   this.prefixIcon, 
   this.suffixIcon,
   this.errorMsg, 
   this.focusNode,
   this.onchanged, 
   this.validator, 
   });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onchanged,
        keyboardType: keyboardType,
        onTap: onTap,
        readOnly: readOnly,
        focusNode: focusNode,
        
        textInputAction: TextInputAction.next,
      
        decoration: InputDecoration(
          hintStyle:TextStyle(color: Colors.grey[5000],fontFamily: "arial") ,
          errorText: errorMsg,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: Colors.grey.shade200,
          filled: true,
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
         
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          )
        ),
      ),
    );
  }
}