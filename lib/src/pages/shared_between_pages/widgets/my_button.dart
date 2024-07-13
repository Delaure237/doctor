import 'package:flutter/material.dart';

import '../constant/constant.dart';
class MyButton extends StatelessWidget {
  final String text;
  final void Function() ? onTap;
  const MyButton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: KToolbarHeight,
          width: double.infinity,
          child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                shadowColor:primaryColor.withOpacity(0.5) ,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
              child:  Text(text,style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),)
          ),
        )
    );

  }
}
