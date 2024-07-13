
import 'package:flutter/material.dart';

import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class PickLocalisation extends StatefulWidget {
  const PickLocalisation({super.key});

  @override
  State<PickLocalisation> createState() => _PickLocalisationState();
}

class _PickLocalisationState extends State<PickLocalisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SafeArea(
          child: 
          (
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: OpenStreetMapSearchAndPick(
       // center: LatLong(23, 89),
        buttonColor: Colors.blue,
        buttonText: 'Set Current Location',
        onPicked: (pickedData) {
         /* print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);*/
        })
            )
          )
         ),
    );
  }
}