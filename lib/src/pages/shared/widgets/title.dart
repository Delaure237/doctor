import 'package:flutter/material.dart';
// ignore: camel_case_types
class   title extends StatelessWidget {
  final String text;
  const title( {super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold,

          fontSize: 18,
          color: Colors.black,
          
      ),
    );
  }
}