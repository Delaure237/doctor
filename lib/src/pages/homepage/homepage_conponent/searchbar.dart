
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Container searchBar(context){
  double size = MediaQuery.of(context).size.width;
  return   Container(
      height: 40,
      width: size*0.9,
      decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
  borderRadius: BorderRadius.circular(7),
      ),
    child: TextField(
    onChanged: (text){
    },
    decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 16),
        border: InputBorder.none,
        hintText:"Search for a specialist",
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        prefixIcon:Icon(Iconsax.search_normal_15,size: 16,color: Colors.grey,)
    ),
    ),
  );
}