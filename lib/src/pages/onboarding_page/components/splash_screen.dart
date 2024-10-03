// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../common/routes/navigation.dart';
import '../../shared/constant/constant.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoadingRole = true; // Indique que le rôle est en cours de chargement
  bool _a = false;
  bool _b = false;
  bool _c = false;
  final bool _d = false;
  bool _e = false;

  @override
  void initState() {
    super.initState();

    // Animation timings
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });

    // Charger le rôle après les animations
    Timer(const Duration(milliseconds: 3400), () async {
      await NavigationService.navigateToNextScreen(context);
      setState(() {
        _isLoadingRole = false; // Indique que le rôle est chargé
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack( // Utilisation d'un Stack pour superposer les widgets
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: _d ? 900 : 2500),
                  curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
                  height: _d ? 0 : _a ? _h / 2 : 20,
                  width: 20,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: _d ? 1 : _c ? 2 : 0),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _d ? _h : _c ? 80 : 20,
                  width: _d ? _w : _c ? 200 : 20,
                  decoration: BoxDecoration(
                    color: _b ? Colors.white : Colors.transparent,
                    borderRadius: _d ? const BorderRadius.only() : BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: _e
                        ? AnimatedTextKit(
                            totalRepeatCount: 1,
                            animatedTexts: [
                              FadeAnimatedText(
                                'The Specialist',
                                duration: const Duration(milliseconds: 1700),
                                textStyle: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoadingRole) // Affichage du CircularProgressIndicator sur l'animation
            Center(
              child: SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : const Color.fromARGB(255, 244, 247, 244),
      ),
    );
  },

            ),
            ),
        ],
      ),
    );
  }
}
