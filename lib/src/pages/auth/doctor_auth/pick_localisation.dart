// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class PickLocalisation extends StatefulWidget {


   const PickLocalisation({
    super.key,

  });

  @override
  State<PickLocalisation> createState() => _PickLocalisationState();
}

class _PickLocalisationState extends State<PickLocalisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SafeArea(
          child: 
          
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: OpenStreetMapSearchAndPick(
  buttonColor: Colors.blue,
  buttonText: 'Set this Location',
  onPicked: (pickedData) {
  log("Picked Data: ${pickedData.toString()}");
  
  // Essayez d'accéder à 'display_name' directement
  String placeName = pickedData.address['amenity'] ?? 'Unknown place';
 // log(pickedData.address as String);
  log("Place Name: $placeName");
  Navigator.pop(context, placeName);
}

)


        ),
            )
        
         
    );
  }
}