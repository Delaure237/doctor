// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
AppBar MedHeader(context,String title, List<Widget> actions){
  return AppBar(
    actions: actions,
    surfaceTintColor: Colors.white,
    elevation: 1,
    shadowColor: Colors.black,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
    title: Align(
      alignment: Alignment.topLeft,
      child: Text(title,style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: "arial"
      ),),
    ),
    centerTitle: false,
  );
}
