import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DoctorSchedule extends StatelessWidget{
  final Color _iconColor = const Color(0xf0589294);

  const DoctorSchedule({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:  Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                image:const  DecorationImage(image: AssetImage("lib/asset/images/cn.jpg"),fit: BoxFit.fill)
            ),
          ),
          title: const Text("Dr Claudel Noubissie",style: TextStyle(
            color: Colors.white,
            fontFamily: "arial",
            fontSize: 12,
          ),
            maxLines: 1,),
          subtitle:const  Text("Chirugien",style: TextStyle(
            color: Colors.white,
            fontFamily: "arial",
            fontSize: 12,
          ),),
          trailing: Container(
            height: 40,
            width: 40,
            decoration:const  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,

            ),
            child: GestureDetector(
              onTap: (){},
              child: Icon(Iconsax.video5,size:16,color:  _iconColor.withOpacity(1),),
            ),
          ),

        ),
        const  SizedBox(height: 2,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:const  Color(0xFF0A5964),
          ),
          height: 40,
          width: 270,
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Iconsax.calendar5,size: 18,color:   _iconColor,),
                  const SizedBox(width: 5,),
                  const Text("Monday,july 1",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "",fontWeight: FontWeight.w400),)
                ],
              ),
              Row(
                children: [
                  Icon(Iconsax.clock5,size: 18,color: _iconColor,),
                  const SizedBox(width: 5,),
                  const Text("8:00 - 9:00",style: TextStyle(color: Colors.white,fontSize: 12,
                      fontWeight: FontWeight.w400
                    //  fontFamily: "arial"
                  ),)
                ],
              )
            ],
          ),

        )
      ],
    );
  }

}