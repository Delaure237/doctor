// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
AppBar Header(context,String title){
  return AppBar(
    surfaceTintColor: Colors.white,
    elevation: 1,
    shadowColor: Colors.black,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
    title: Text(title,style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: "arial"
    ),),
    centerTitle: true,
  );
}
