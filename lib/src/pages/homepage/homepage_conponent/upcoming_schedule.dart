
import 'package:doctor/src/pages/homepage/homepage_conponent/schedule.dart';
import 'package:flutter/material.dart';

import '../../shared_between_pages/constant/constant.dart';

class Schedule extends StatelessWidget {
  //final  Color _cardColor = const Color(0xf0037075);

  const Schedule({super.key});
  @override
  Widget build(BuildContext context) {

    return  Stack(
      children:[
        Padding(
          padding:const  EdgeInsets.fromLTRB(20, 16, 20, 3),
          child: Card(
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Container(
              height: 150,
              width: 600,
              decoration: BoxDecoration(
                color:  primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.fromLTRB(10, 16, 10, 20),
          child: Card(
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 8,
            child: Container(
              width: 400,
              height: 140,
              decoration: BoxDecoration(
                color:   primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(bottom: 20,top: 16),
          child: Card(
              elevation: 16,
              shadowColor: Colors.transparent,
              child:Container(
                height: 130,
                width: 700,

                decoration: BoxDecoration(
                  color:  primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10,left: 0,right: 0),
                  child: DoctorSchedule(),
                ),

              )
          ),
        )
      ],
    );
  }

}