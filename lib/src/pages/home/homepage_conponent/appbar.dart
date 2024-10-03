import 'package:doctor/src/pages/userprofile_page/user_profile_page.dart';

import 'package:flutter/material.dart';


//import 'package:badges/badges.dart' as badges;

/* this is the file for the hommePage appBar*/
AppBar header(context){

  return AppBar(
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,  
      toolbarHeight: 70,
      title:Padding(
        padding: const EdgeInsets.only(top: 40,left: 0,bottom: 20),
        child: Column(
          children: [
            
            Hero(
              tag: "profile",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserProfilePage()));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      image:const  DecorationImage(image: AssetImage("lib/asset/images/with.png"),fit: BoxFit.fill)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3,),

          ],
        ),
      ),
      actions: [
        Stack(
            children: [
              IconButton(
                icon:const  Icon(Icons.notifications,size: 30,color: Colors.black,),
                onPressed: () {},
              ),
              Positioned(
                top: 15,
                right: 10,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ]
        )
      ]
  );
}