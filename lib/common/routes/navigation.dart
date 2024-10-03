import 'package:doctor/src/pages/home/homepage_conponent/nav_bar.dart';
import 'package:doctor/src/pages/onboarding_page/onboarding_screen.dart';
import 'package:doctor/src/pages/shared/widgets/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationService {
  static Future<void> navigateToNextScreen(BuildContext context) async {
    final isAuthenticated = await _checkAuthentication();

    if (Navigator.of(context).context.mounted) {
      if (isAuthenticated) {
        _navigateToPage(context, const ExploreBar());
      } else {
        _navigateToPage(context, const OnboardingPage());
      }
    }
  }

  static Future<bool> _checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_authenticated') ?? false;
  }


  static void _navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
    SlideTransition1(page),
      (route) => false,
    );
  }
}
