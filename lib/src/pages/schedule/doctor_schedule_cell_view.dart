import 'package:doctor/src/models/doctor.dart';
import 'package:doctor/src/pages/schedule/widgets/button.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
class ScheduleCellView extends StatelessWidget {
  const ScheduleCellView({super.key, required this.doctor});
 final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        color: bgColor,
         borderRadius: BorderRadius.circular(12),
          boxShadow: const [
                       BoxShadow(
                        
             color: Color.fromARGB(26, 0,0, 0), // Couleur de l'ombre et son opacité
           blurRadius: 7, // Flou de l'ombre
            offset:  Offset(0, 1.5), // Décalage de l'ombre par rapport au container
           ),
          ]
      ),
     height: MediaQuery.of(context).size.height/3.5,
     width: double.infinity,
     child:  Column(
    // mainAxisAlignment:MainAxisAlignment.spaceAround,
      children: [
         ListTile(
          title: Text(doctor.name),
          subtitle: Text(doctor.speciality),
          trailing: CircleAvatar(
            backgroundImage: AssetImage(doctor.path),
          ),
         ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal:defaultPadding),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.calendar5,color: primaryIconColor,size: 16,),
                    Text("10/05/2024",style:TextStyle(fontSize:12)),
                  ],
                
              ),),
               Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.clock5,color: primaryIconColor,size: 16,),
                    Text("09:00 PM",style:TextStyle(fontSize:12)),
                  ],
                
              ),),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.circle,color: Color.fromARGB(255, 180, 233, 182),size: 16,),
                    Text("Confirmed",style: TextStyle(fontSize: 12),),
                  ],
                
              ),)
            ],
           ),
         ),
        const SizedBox(height: 12,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           Button(color: unfocusColor, text: "Cancel", textColor: Colors.black,),
           Button(color: primaryColor, text: "Reschedule",textColor: bgColor,),
          ],
         )

      ],
     ),
    );
  }
}