// ignore_for_file: camel_case_types

import 'package:doctor/src/pages/onboarding_page/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';

class Onboarding_1 extends StatelessWidget {
 
  const Onboarding_1({super.key,});

  @override
  Widget build(BuildContext context) {
    return OnBoardingCard(
       path: 'lib/asset/images/istockphoto-1315185678-612x612.jpg', 
       desc:
 "your pratical solution for making medical appointments with ease. Wheter you need a video call, audio or message consultation with a doctor, we're hereto help you to get the care you need, wherever you are."
       ,
       onPressed: () { },
        title: 'Book an Appointment'
        );
  }
}