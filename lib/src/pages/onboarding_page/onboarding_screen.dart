import 'package:doctor/src/pages/onboarding_page/onboarding_1.dart';
import 'package:doctor/src/pages/onboarding_page/onboarding_2.dart';
import 'package:doctor/src/pages/onboarding_page/onboarding_3.dart';
import 'package:doctor/src/pages/shared_between_pages/constant/constant.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var  currentIndex =0;
 final PageController _pageController = PageController(initialPage: 0);
  
  final List<Widget> _onBoardingPages = [
    const Onboarding_1(),
    const Onboarding_2(),
    const Onboarding_3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        
             PageView(
          controller: _pageController,
          children: _onBoardingPages,
        ),
        
        
      
           Padding(
            padding: const EdgeInsets.only(top: 60),
             child: SmoothPageIndicator(
              effect:const WormEffect(
                activeDotColor: primaryColor,
              ),
              controller: _pageController, 
              count: 3),
           ),
      ]
        )
      
    );
    /*PageView(
       controller: _pageController,
       
    );*/
  }
}
