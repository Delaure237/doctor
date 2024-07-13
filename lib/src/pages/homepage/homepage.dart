

import 'package:doctor/src/pages/homepage/homepage_conponent/appbar.dart';
import 'package:doctor/src/pages/homepage/homepage_conponent/recommend_doctor_part/doctors_container.dart';
import 'package:doctor/src/pages/homepage/homepage_conponent/upcoming_schedule.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';
import 'package:flutter/material.dart';

import '../shared_between_pages/widgets/title.dart';
import 'homepage_conponent/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //SharedWidget shared = SharedWidget();

    return Scaffold(

      appBar: header(context),
      body: RefreshIndicator(
        onRefresh: () async { 

         },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding,horizontal: defaultPadding),
              child: Column(
                children: [
                   
                  const  Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: [
                         title(text: "Hi,withney \u{1F44B} "),
                        ],
                      )
                  ),
                  const SizedBox(height: defaultPadding,),
                    searchBar(context),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const title(text: "Upcoming Schedule"),
                      GestureDetector(
                        onTap: () {},
                        child: subtitle(),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Schedule(),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const title(text: "Recommended Specialist"),
                      GestureDetector(
                        onTap: () {},
                        child: subtitle(),
                      )
                    ],
                  ),
                  DoctorContainer()
        
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget subtitle() {
    return const Text(
      "View all",
      style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontFamily: "arial"
      ),
    );
  }
}
