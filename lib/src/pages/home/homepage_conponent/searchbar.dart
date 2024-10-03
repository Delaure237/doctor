
import 'package:doctor/src/pages/shared/constant/constant.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../../shared/widgets/slide_transition.dart';
import 'search_page.dart';

Container searchBar(context, String hintext){
  double size = MediaQuery.of(context).size.width;
  return   Container(
      height: 45,
      width: size*0.9,
      decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
  borderRadius: BorderRadius.circular(20),
      ),
   
      
      child: TextField(
        onTap: (){
             Navigator.push(context, SlideTransition2( const SearchPage()), );
        },
      onChanged: (text){
      },
      decoration:  InputDecoration(
        
        suffixIcon:Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 40,
            width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: primaryColor,
          ),
          child: const Center(child: Icon(Iconsax.filter,color: Colors.white,)),
          ),
        ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
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