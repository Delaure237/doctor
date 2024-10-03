import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({super.key});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration:  const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipOval(
                      child:Image.asset("lib/asset/images/Basile-Njei.jpg") ,
                      ),
                  ),
                 const   SizedBox(height: 24,),
               const   Text("Name"),
              const    Text("Email")
                ],
              )
            ],
          ),
          ),

        )
      );
  }
}