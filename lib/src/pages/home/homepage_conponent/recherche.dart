
// ignore_for_file: non_constant_identifier_names

import 'package:doctor/src/pages/shared/constant/constant.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';


Container Search(context, String hintext,TextEditingController controller){
  double size = MediaQuery.of(context).size.width;
  return   Container(
      height: 40,
      width: size*0.9,
      decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
  borderRadius: BorderRadius.circular(12),
      ),
   
      
      child: TextField(
    controller: controller,
      onChanged: (text){
      },
      decoration:  InputDecoration(
        
        suffixIcon:Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 40,
            width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: primaryColor,
          ),
          child: const Center(child: Icon(Iconsax.filter,color: Colors.white,)),
          ),
        ),
          contentPadding: const EdgeInsets.all(8),
          border: InputBorder.none,
          hintText:hintext,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          prefixIcon:const Icon(Iconsax.search_normal_15,size: 20,color: Colors.grey,)
      ),
      ),
    
  );
}