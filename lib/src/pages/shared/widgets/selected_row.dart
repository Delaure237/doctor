import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowChoice extends StatefulWidget {
  final String text;
  
  final bool  isSelected;
    final String path;
   const RowChoice({super.key, required this.text,required this.isSelected, required  this.path});

  @override
  State<RowChoice> createState() => _RowChoiceState();
}

class _RowChoiceState extends State<RowChoice> {
  bool _isSelected = false;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
               onTap: (){
                setState(() {
                  _isSelected =! _isSelected;
                });
               },
               child: Expanded(
                flex: 2,
                 child: Row(
                  
                   children: [
                    Image.asset(widget.path,height: 48,width: 48,),
                    const  SizedBox(width: 12,),
                    Text(
                    widget.text,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                               fontWeight: FontWeight.bold,
                              fontSize: 14,
                              ),
                    )
                   ),
                   ],
                 ),
               ),
               
        ),
        Radio(
          fillColor: const MaterialStatePropertyAll(primaryColor),
          autofocus: true,
          value: _isSelected, 
          groupValue: _isSelected ? widget.text : null, 
          focusColor: primaryColor,
          onChanged: (value){
          setState(() {
            _isSelected = value as bool;
          });
        })
      ],
    );
  }
}