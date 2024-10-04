

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constant/constant.dart';
class PayementField extends StatelessWidget {

 
  final TextEditingController controller;
  final String hintText;

  const PayementField({super.key,required this.controller, required this.hintText,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
             textAlignVertical: TextAlignVertical.center,
            
             style: GoogleFonts.poppins(
             textStyle :const TextStyle(
                fontSize: 16,
             color: Colors.grey,
             )
           
            
             ),
             controller: controller,
           
             decoration:  InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                textStyle: const  TextStyle(

                )
              ),
               contentPadding: const EdgeInsets.all(8),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                 borderSide: const  BorderSide(
                   color: primaryColor,
                   width: 1,
                 )
               ),
                 border: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(
                         Radius.circular(12)),
                     borderSide: BorderSide(
                       color:  Colors.grey,
                       width: 1,
                     )
                 ),
             
      
      
               ),
      
      
      
      ),
    );
  }
}
