

import 'package:flutter/material.dart';

class SlideTransition1 extends PageRouteBuilder {

  final Widget page;
  SlideTransition1(this.page)  :  super(
    pageBuilder: (context,animation,anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context,animation, otherAnimation,child) {
      animation = CurvedAnimation(parent: animation,curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastOutSlowIn);
       return SlideTransition(
        position: Tween(begin: const Offset(1.0, 0.0), end : const Offset(0.0, 0.0)).animate(animation),
        child:page
        ) ;
    }
  );
}

class SlideTransition2 extends PageRouteBuilder {

  final Widget page;
  SlideTransition2(this.page)  :  super(
    pageBuilder: (context,animation,anotherAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context,animation, otherAnimation,child) {
      animation = CurvedAnimation(parent: animation,curve: Curves.fastLinearToSlowEaseIn, reverseCurve: Curves.fastOutSlowIn);
       return Align(
         alignment: Alignment.topCenter,
          heightFactor: animation.value,
         child:page,
       
       
       );
    }
  );
}