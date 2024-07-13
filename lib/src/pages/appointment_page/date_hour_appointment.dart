// ignore_for_file: non_constant_identifier_names

import 'package:doctor/src/pages/appointment_page/payement_page.dart';
import 'package:doctor/src/pages/appointment_page/widgets/my_text_field.dart';
import 'package:doctor/src/pages/appointment_page/widgets/type_of_ap.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:doctor/src/pages/shared_between_pages/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../authentification_page/authentication_conponents/my_button.dart';
class AppointmentInfo
 extends StatefulWidget {
  const AppointmentInfo
  ({super.key});

  @override
  State<AppointmentInfo > createState() => AppointmentInfoState();
}

class AppointmentInfoState extends State<AppointmentInfo> {
  String formattedTime = DateFormat.Hm().format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  Title(String text) =>Text(
        text,
        style: GoogleFonts.poppins(
         textStyle: const TextStyle(       
        fontSize: 18,
        fontWeight: FontWeight.w500)) 
      );
      
       void _datePicker()  async {
    DateTime?  newDate = await  showDatePicker(
      //barrierColor: Colors.white,
      context: context,
      initialDate:selectedDate ,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add( const Duration(days: 365)),
    );
    if(newDate!= null){
      setState(() {
        dateController.text = DateFormat('dd/MM/y').format(newDate);
        selectedDate = newDate;
      });
    }
  }

      void _startTimePicker() async {
    TimeOfDay?  newTime = await  showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(newTime!=null){
      setState(() {
        final    selectedTime=  DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,newTime.hour,newTime.minute);
        formattedTime = DateFormat.Hm().format(selectedTime);
        timeController.text = formattedTime ;

      });
    }
  }
      @override
  void initState() {
    dateController.text = DateFormat('dd/MM/y').format(DateTime.now());
    timeController.text = formattedTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    appBar: Header(context,"Appointment Info"),
     body: Padding(
      padding: const  EdgeInsets.all(defaultPadding),
       child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                 
                   const  SizedBox(height: 24,),
                  Title("Date"),
                  //const SizedBox(height: 12,),
                  MyTextfield(
                    onTap: _datePicker,
                     icon: Iconsax.calendar5, 
                     readOnly: true, 
                     controller: dateController,
                     
                     ),
                    const  SizedBox(height: 24,),
                     Title("Time"),
                     MyTextfield(onTap: _startTimePicker, controller: timeController, icon: Iconsax.clock5, readOnly: true),
                     
                     Title("Type"),
                    
                     const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Type())
                      ],
                     ),
                     const SizedBox(height: 100,),
                    SizedBox(
                      width:double.infinity,
                      child: MyButton(onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Payement()));
                      },   title: "Next",),
                    )
       
                     
                ]
            
            
          
        ),
     ),
   );
  }

}