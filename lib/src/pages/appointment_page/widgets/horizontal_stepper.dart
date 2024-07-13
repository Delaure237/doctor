import 'package:flutter/material.dart';
class HorizontalStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  const HorizontalStepper({super.key, required this.steps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      );
     /*Container(
         height: 50,
         child: ListView.builder(
          itemCount: steps.length,
          scrollDirection:  Axis.horizontal,
          itemBuilder:(BuildContext context, index) {
           return Container(
             margin: const EdgeInsets.symmetric(horizontal:10),
             width: 100,
             child: Column(
              children: [
                  
              ],
             ),
           );
          } )
        
    );*/
  }
}