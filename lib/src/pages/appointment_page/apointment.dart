
import 'package:doctor/src/pages/appointment_page/payement_page.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:doctor/src/pages/shared/widgets/appbar.dart';
import 'package:doctor/src/pages/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  //final PageController _pageController = PageController();
  int currentStep = 0;
   bool isActive = false;
  void _gotonextStepp(){
             
                 currentStep+=1;
              
                     
                     
                    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Appointment",[]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
                    Expanded(

                child:  Stepper(
                  margin:const  EdgeInsets.all(0),
                  elevation: 0,
                  type: StepperType.horizontal,
                  currentStep: 0,
                 onStepContinue: _gotonextStepp,
                    
                  
                  /*onStepCancel: (){
                    setState(() {
                      if (_currentStep>0) {
                        _currentStep-=1;
                        
                      }
                    });
                  },*/
                  steps:  const [
                  
                         Step(
                          
                         
                         // state: StepState.indexed,
                          title:  Text(""),
                         content:  Payement() ,
                         // AppointmentInfo(),
                        subtitle:   Text("information"),
                         stepStyle:  StepStyle(
                           color:primaryColor ,
                          // connectorColor: isActive ? primaryColor : Colors.grey,
                         )
                         ),
                       Step(
                        
                          subtitle: Text("payement"), 
                          content: Payement(),
                          title: Text(""),
                           stepStyle:  StepStyle(
                          color:primaryColor,
                         )
                          )
                  ]
                  ),
                   
                

              ),
                 MyButton(onTap: _gotonextStepp, text: "Next")
            ]
          )
        )
      )
    );
  }
}