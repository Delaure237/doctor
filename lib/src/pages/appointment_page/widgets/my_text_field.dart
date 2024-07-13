

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_between_pages/constant/constant.dart';
class MyTextfield extends StatelessWidget {

  final void Function() ? onTap;
  final TextEditingController controller;
  final IconData? icon;
  final bool readOnly;

  const MyTextfield({super.key,required this.onTap,required this.controller,required this.icon,required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
             textAlignVertical: TextAlignVertical.center,
             readOnly: readOnly,
             style: GoogleFonts.poppins(
             textStyle :const TextStyle(
                fontSize: 16,
             color: Colors.grey,
             )
           

             ),
             controller: controller,
             onTap: onTap,
             decoration:  InputDecoration(
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
               suffixIcon:Padding(
                 padding:const EdgeInsets.only(top: 10,right: 20,bottom: 10,),
                 child: GestureDetector(
                   onTap: () async {
                        onTap;
                   },
                   child: Container(
                     height: 10,
                     width: 10,
                     decoration:  BoxDecoration(
                       shape: BoxShape.circle,
                       color: secondaryColor.withOpacity(0.2),
                     ),
                     child: Icon(icon,size: 18, color: primaryColor,),
                   ),
                 ),
               ),
      
      
               ),
      
      
      
      ),
    );
  }
}
