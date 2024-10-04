import 'package:doctor/src/pages/onboarding_page/account_type.dart';
import 'package:doctor/src/pages/onboarding_page/components/next_button.dart';
import 'package:doctor/src/pages/shared/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                itemCount: data.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardContent(
                    illustration: data[index]['illustration'],
                    title: data[index]["title"],
                    description: data[index]["text"],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                height: 30, // Ajustez la hauteur pour un bon espacement
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: data.length,
                  effect:  const ExpandingDotsEffect(
                    activeDotColor: primaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: NextButton(
                title: currentIndex <3 ? "Next" : "Get Started",
                
                onPressed: () {
                  currentIndex <3 ? setState(() {
                     currentIndex = currentIndex+1;
                     _pageController.animateToPage(
                      currentIndex, duration:const Duration(milliseconds: 500), 
                      curve: Curves.decelerate
                      );
                  })
                   :
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const AccountType()),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.description,
    
  });

  final String illustration, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: illustration.isNotEmpty
                  ? Image.asset(illustration, fit: BoxFit.cover)
                  : Container(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> data = [
  {
    "illustration": "lib/asset/images/allinone.png",
    "title": "All-in-One Health Management",
    "text":
        "Manage your entire health journey from one app—schedule video consultations, order medications and medical tests for home delivery, and monitor your health status through connected devices like your Apple Watch.",
  },
  {
    "illustration": "lib/asset/images/9562.jpg",
    "title": "Remote Monitoring",
    "text":
        "Keep track of your health with real-time insights directly from your Apple Watch. Stay informed and take control of your well-being.",
  },
  {
    "illustration": "lib/asset/images/test.png",
    "title": "Order Medical Exams at Home",
    "text":
        "Easily schedule and receive medical exams in the comfort of your home. We bring healthcare to your doorstep.",
  },
  {
    "illustration": "lib/asset/images/order_medecine.png",
    "title": "Shop for Medications",
    "text":
        "Access a wide range of medications and health products right from your phone. Convenient, reliable, and delivered to you.",
  },
];
